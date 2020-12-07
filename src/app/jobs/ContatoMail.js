import { format } from 'date-fns';
import pt from 'date-fns/locale/pt';
import Mail from '../../lib/Mail';

class ContatoMail {
  get key() {
    return 'ContatoMail';
  }

  async handle({ data }) {
    // desestruturando para pegar os dados do email
    const { nome, email, telefone, assunto, mensagem } = data;

    console.log('A fila executou')

    await Mail.sendMail({
      to: 'Alexandre Feio <alefeio@gmail.com>',
      subject: 'Contato - HCS Aviation',
      template: 'contato',
      context: {
        nome,
        email,
        telefone,
        assunto,
        mensagem,
        date: format(new Date(), "'Dia' dd 'de' MMMM', às' H'h'mm", {
          locale: pt,
        }),
      },
    });
  }
}

export default new ContatoMail();
