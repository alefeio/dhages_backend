import Blog from '../models/Blog';
import File from '../models/File';
import { Op } from 'sequelize';

class BlogController {
  async store(req, res) {
    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const { titulo, descricao, texto, autor, img_id } = req.body;

    const registroExiste = await Blog.findOne({ where: { titulo } });

    if (registroExiste) {
      return res.status(400).json({ erro: 'Registro já existe!' });
    }

    const usuario_id = req.usuarioId;

    const registro = await Blog.create({
      titulo,
      descricao,
      texto,
      autor,
      usuario_id,
      img_id,
    });

    return res.json(registro);
  }

  async index(req, res) {
    const { page = 1 } = req.query;

    const registro = await Blog.findAll({
      where: { ativo: true },
      order: [['created_at', 'desc']],
      attributes: ['id', 'titulo', 'descricao', 'texto', 'autor'],
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

  async relacionados(req, res) {
    const idPost = req.params.id;

    const registro = await Blog.findAll({
      where: { ativo: true, id: { [Op.ne]: idPost } },
      attributes: ['id', 'titulo', 'descricao', 'texto', 'autor'],
      order: [['created_at', 'desc']],
      limit: 5,
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

    const registro = await Blog.findByPk(req.params.id);

    if (!registro) {
      return res.status(400).json({ erro: 'Registro não encontrado!' });
    }

    registro.ativo = false;

    registro.save();

    return res.json(registro);
  }
}

export default new BlogController();
