import Banner from '../models/Banner';
import File from '../models/File';
import { Op } from 'sequelize';

class BannerController {
  async store(req, res) {
    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const { pai_id, url, img_id } = req.body;

    const usuario_id = req.usuarioId;

    const registro = await Banner.create({
      pai_id,
      url,
      img_id,
      usuario_id,
    });

    return res.json(registro);
  }

  async index(req, res) {
    const { page = 1 } = req.query;

    const registro = await Banner.findAll({
      where: { ativo: true },
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

    const registro = await Banner.findByPk(req.params.id);

    if (!registro) {
      return res.status(400).json({ erro: 'Registro não encontrado!' });
    }

    registro.ativo = false;

    registro.save();

    return res.json(registro);
  }
}

export default new BannerController();
