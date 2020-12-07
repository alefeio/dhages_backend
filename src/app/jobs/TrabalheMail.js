import { format } from 'date-fns';
import pt from 'date-fns/locale/pt';
import Mail from '../../lib/Mail';

class TrabalheMail {
  get key() {
    return 'TrabalheMail';
  }

  async handle({ data }) {
    // desestruturando para pegar os dados do email
    const { nome, email, telefone, mensagem } = data;

    console.log('A fila executou')

    await Mail.sendMail({
      to: 'Alexandre Feio <alefeio@gmail.com>',
      subject: 'Trabalhe com a Gente - Brazilian Black Pepper',
      template: 'trabalhe',
      context: {
        nome,
        email,
        telefone,
        mensagem,
        date: format(new Date(), "'Dia' dd 'de' MMMM', às' H'h'mm", {
          locale: pt,
        }),
      },
    });
  }
}

export default new TrabalheMail();
