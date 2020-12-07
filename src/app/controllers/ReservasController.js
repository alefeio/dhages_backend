import * as Yup from 'yup';
import { format } from 'date-fns';
import pt from 'date-fns/locale/pt';

import Reservas from '../models/Reservas';
import Viagens from '../models/Viagens';
import Mail from '../../lib/Mail';

// import ContatoMail from '../jobs/ContatoMail';
// import Queue from '../../lib/Queue';

class ReservasController {
  async store(req, res) {
    const schema = Yup.object().shape({
      viagem_id: Yup.number().required(),
      nome: Yup.string().required(),
      email: Yup.string().email().required(),
      telefone: Yup.number(),
      mensagem: Yup.string().required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ erro: 'Falha na validação!' });
    }

    const reserva = await Reservas.create(req.body);

    // await Queue.add(ContatoMail.key, contato);

    // await Mail.sendMail({
    //   to: 'Alexandre Feio <alefeio@gmail.com>',
    //   subject: 'Contato - Brazilian Black Pepper',
    //   template: 'contato',
    //   context: {
    //     nome,
    //     email,
    //     telefone,
    //     assunto,
    //     mensagem,
    //     date: format(new Date(), "'Dia' dd 'de' MMMM', às' H'h'mm", {
    //       locale: pt,
    //     }),
    //   },
    // });

    return res.json(reserva);
  }

  async index(req, res) {
    // if (!req.isAdmin) {
    //   return res.status(401).json({ erro: 'Operação não autorizada!' });
    // }

    const contatos = await Reservas.findAll({
      where: { ativo: true },
      order: [['created_at', 'desc']],
      include: [
        {
          model: Viagens,
          as: 'viagem',
          attributes: ['id', 'cidade', 'estado', 'saida', 'retorno'],
        },
      ],
    });

    return res.json(contatos);
  }

  async delete(req, res) {
    if (!req.usuarioAdmin) {
      return res.status(401).json({ erro: 'Operação não autorizada!' });
    }

    const registro = await Reservas.findByPk(req.params.id);

    if (!registro) {
      return res.status(400).json({ erro: 'Registro não encontrado!' });
    }

    registro.ativo = false;

    registro.save();

    return res.json(registro);
  }
}

export default new ReservasController();
