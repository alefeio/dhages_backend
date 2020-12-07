import Viagens from '../models/Viagens';
import File from '../models/File';
import { Op } from 'sequelize';

class BuscaController {
  async index(req, res) {
    const { page = 1, busca } = req.query;

    const viagens = await Viagens.findAll({
      where: {
        ativo: true,
        nome: { [Op.iLike]: `%${busca}%` },
        cidade: { [Op.iLike]: `%${busca}%` },
        estado: { [Op.iLike]: `%${busca}%` },
        descricao: { [Op.iLike]: `%${busca}%` },
      },
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

    console.log(viagens);

    return res.json(viagens);
  }
}

export default new BuscaController();
