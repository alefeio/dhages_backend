import * as Yup from 'yup';
import Ondeestamos from '../models/Ondeestamos';
import File from '../models/File';

class OndeestamosController {
  async store(req, res) {
    const schema = Yup.object().shape({
      responsavel: Yup.string().required(),
      email: Yup.string().email().required(),
      cep: Yup.string().required(),
      rua: Yup.string().required(),
      numero: Yup.number().required(),
      bairro: Yup.string().required(),
      cidade: Yup.string().required(),
      uf: Yup.string().max(2).required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ erro: 'Falha na validação!' });
    }

    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const { cep, rua, numero } = req.body;

    const existe = await Ondeestamos.findOne({ where: { cep, rua, numero } });

    if (existe) {
      return res.status(400).json({ erro: 'Ponto já existe!' });
    }

    const {
      responsavel,
      email,
      telefone,
      complemento,
      bairro,
      cidade,
      uf,
      img_id,
      mapa,
    } = req.body;

    const usuario_id = req.usuarioId;

    const ponto = await Ondeestamos.create({
      responsavel,
      email,
      telefone,
      cep,
      rua,
      numero,
      complemento,
      bairro,
      cidade,
      uf,
      img_id,
      usuario_id,
      mapa,
    });

    return res.json(ponto);
  }

  async index(req, res) {
    const { page = 1 } = req.query;

    const pontos = await Ondeestamos.findAll({
      where: { ativo: true },
      order: ['created_at'],
      limit: 20,
      offset: (page - 1) * 20,
      attributes: [
        'id',
        'responsavel',
        'email',
        'telefone',
        'cep',
        'rua',
        'numero',
        'complemento',
        'bairro',
        'cidade',
        'uf',
        'mapa',
      ],
      include: [
        {
          model: File,
          as: 'imagem',
          attributes: ['id', 'path', 'url'],
        },
      ],
    });

    return res.json(pontos);
  }

  async detail(req, res) {
    const busca = req.params.id;

    const ponto = await Ondeestamos.findOne({
      where: { id: busca, ativo: true },
      include: [
        {
          model: File,
          as: 'imagem',
          attributes: ['id', 'path', 'url'],
        },
      ],
    });

    return res.json(ponto);
  }

  async update(req, res) {
    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const ponto = await Ondeestamos.findByPk(req.params.id);

    if (!ponto) {
      return res.status(400).json({ erro: 'Ponto não existe!' });
    }

    await ponto.update(req.body);

    return res.json(ponto);
  }

  async delete(req, res) {
    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const ponto = await Ondeestamos.findByPk(req.params.id);

    if (!ponto) {
      return res.status(400).json({ erro: 'Ponto não existe!' });
    }

    ponto.ativo = false;

    await ponto.save();

    return res.json(ponto);
  }
}

export default new OndeestamosController();
