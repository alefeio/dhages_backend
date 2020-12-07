import * as Yup from 'yup';
import { format } from 'date-fns';
import pt from 'date-fns/locale/pt';

import Trabalheforms from '../models/Trabalheforms';
import Mail from '../../lib/Mail';

// import TrabalheMail from '../jobs/TrabalheMail';
// import Queue from '../../lib/Queue';

class TrabalheformsController {
  async store(req, res) {
    const schema = Yup.object().shape({
      nome: Yup.string().required(),
      email: Yup.string().email().required(),
      mensagem: Yup.string().required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ erro: 'Falha na validação!' });
    }

    const { nome, email, telefone, mensagem } = await Trabalheforms.create(
      req.body
    );

    // await Queue.add(TrabalheMail.key, trabalhe);

    // await Mail.sendMail({
    //   to: 'Alexandre Feio <alefeio@gmail.com>',
    //   subject: 'Trabalhe com a Gente - Brazilian Black Pepper',
    //   template: 'trabalhe',
    //   context: {
    //     nome,
    //     email,
    //     telefone,
    //     mensagem,
    //     date: format(new Date(), "'Dia' dd 'de' MMMM', às' H'h'mm", {
    //       locale: pt,
    //     }),
    //   },
    // });

    return res.json({
      nome,
      email,
      telefone,
      mensagem,
    });
  }

  async index(req, res) {
    // if (!req.isAdmin) {
    //   return res.status(401).json({ erro: 'Operação não autorizada!' });
    // }

    const trabalhe = await Trabalheforms.findAll({
      attributes: ['nome', 'email', 'telefone', 'mensagem', 'created_at'],
    });

    return res.json(trabalhe);
  }
}

export default new TrabalheformsController();
