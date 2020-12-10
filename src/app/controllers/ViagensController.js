import * as Yup from 'yup';
import Viagens from '../models/Viagens';
import Paiimgs from '../models/Paiimgs';
import File from '../models/File';
import { Op } from 'sequelize';

class ViagensController {
  async store(req, res) {
    const schema = Yup.object().shape({
      cidade: Yup.string().required(),
      estado: Yup.string().required(),
      saida: Yup.date().required(),
      retorno: Yup.date().required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ erro: 'Falha na validação!' });
    }

    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const { cidade, estado, saida, retorno, descricao, img_id } = req.body;

    const existe = await Viagens.findOne({
      where: { cidade, estado, saida, retorno },
    });

    if (existe) {
      return res.status(400).json({ erro: 'Registro já existe!' });
    }

    const usuario_id = req.usuarioId;

    const viagem = await Viagens.create({
      cidade,
      estado,
      saida,
      retorno,
      descricao,
      usuario_id,
      img_id,
    });

    return res.json(viagem);
  }

  async index(req, res) {
    const { page = 1 } = req.query;

    const data = Date();

    const registros = await Viagens.findAll({
      where: { ativo: true, saida: { [Op.gt]: data } },
      order: ['saida'],
      limit: 20,
      offset: (page - 1) * 20,
      include: [
        {
          model: File,
          as: 'imagem',
          attributes: ['id', 'path', 'url'],
        },
      ],
    });

    return res.json(registros);
  }

  async home(req, res) {
    const data = Date();

    const registros = await Viagens.findAll({
      where: { ativo: true, saida: { [Op.gt]: data } },
      order: ['saida'],
      limit: 6,
      include: [
        {
          model: File,
          as: 'imagem',
          attributes: ['id', 'path', 'url'],
        },
      ],
    });

    return res.json(registros);
  }

  async realizadas(req, res) {
    const { page = 1 } = req.query;

    const data = Date();

    const registros = await Viagens.findAll({
      where: { ativo: true, saida: { [Op.lt]: data } },
      order: [['saida', 'desc']],
      limit: 20,
      offset: (page - 1) * 20,
      include: [
        {
          model: File,
          as: 'imagem',
          attributes: ['id', 'path', 'url'],
        },
      ],
    });

    return res.json(registros);
  }

  async galeria(req, res) {
    const { page = 1 } = req.query;

    const data = Date();

    const registros = await Viagens.findAll({
      where: { ativo: true, saida: { [Op.lt]: data }, galeria: true },
      order: [['saida', 'desc']],
      limit: 20,
      offset: (page - 1) * 20,
      include: [
        {
          model: File,
          as: 'imagem',
          attributes: ['id', 'path', 'url'],
        },
      ],
    });

    // console.log('registros Viagens: ', registros);

    return res.json(registros);
  }

  async relacionados(req, res) {
    const idPost = req.params.id;
    const data = Date();

    const registros = await Viagens.findAll({
      where: { ativo: true, id: { [Op.ne]: idPost }, saida: { [Op.gt]: data } },
      order: ['saida'],
      limit: 5,
      include: [
        {
          model: File,
          as: 'imagem',
          attributes: ['id', 'path', 'url'],
        },
      ],
    });

    return res.json(registros);
  }

  async detail(req, res) {
    const busca = req.params.id;

    const registro = await Viagens.findOne({
      where: { id: busca, ativo: true },
      include: [
        {
          model: File,
          as: 'imagem',
          attributes: ['id', 'path', 'url'],
        },
      ],
    });

    return res.json(registro);
  }

  async update(req, res) {
    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const registro = await Viagens.findByPk(req.params.id);

    if (!registro) {
      return res.status(400).json({ erro: 'Não encontrado!' });
    }

    await registro.update(req.body);

    return res.json(registro);
  }

  async delete(req, res) {
    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const registro = await Viagens.findByPk(req.params.id);

    if (!registro) {
      return res.status(400).json({ erro: 'Não encontrado!' });
    }

    registro.ativo = false;

    registro.save();

    return res.json(registro);
  }
}

export default new ViagensController();
