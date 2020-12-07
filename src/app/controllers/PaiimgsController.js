import Paiimgs from '../models/Paiimgs';
import Viagens from '../models/Viagens';
import File from '../models/File';
import { Op } from 'sequelize';

class PaiimgsController {
  async store(req, res) {
    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const { descricao, pai_id, img_id } = req.body;

    const usuario_id = req.usuarioId;

    const registro = await Paiimgs.create({
      descricao,
      pai_id,
      img_id,
      usuario_id,
    });

    const viagem = await Viagens.findByPk(pai_id);

    viagem.galeria = true;

    viagem.save();

    return res.json(registro);
  }

  async index(req, res) {
    const { page = 1 } = req.query;

    const busca = req.params.id;

    const registro = await Paiimgs.findAll({
      where: { ativo: true, pai_id: busca },
      order: [['created_at', 'desc']],
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

    return res.json(registro);
  }

  async excluirAlbum(req, res) {
    const busca = req.params.id;

    const viagem = await Viagens.findByPk(busca);

    viagem.galeria = false;

    viagem.save();

    return res.json({ ok: true });
  }

  async detail(req, res) {
    const busca = req.params.id;

    const registro = await Blog.findOne({
      where: { id: busca, ativo: true },
      attributes: ['id', 'titulo', 'descricao', 'texto', 'autor'],
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

    const registro = await Blog.findByPk(req.params.id);

    if (!registro) {
      return res.status(400).json({ erro: 'Registro não encontrado!' });
    }

    await registro.update(req.body);

    return res.json({ registro });
  }

  async delete(req, res) {
    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const registro = await Paiimgs.findByPk(req.params.id);

    if (!registro) {
      return res.status(400).json({ erro: 'Registro não encontrado!' });
    }

    registro.ativo = false;

    registro.save();

    return res.json(registro);
  }
}

export default new PaiimgsController();
