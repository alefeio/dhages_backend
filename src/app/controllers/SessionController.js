import jwt from 'jsonwebtoken';
import * as Yup from 'yup';

import Usuario from '../models/Usuario';
import authConfig from '../../config/auth';

class SessionController {
  async store(req, res) {
    const schema = Yup.object().shape({
      email: Yup.string().email().required(),
      password: Yup.string().required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ erro: 'Falha na validação!' });
    }

    const { email, password } = req.body;

    const usuario = await Usuario.findOne({
      where: { email },
    });

    if (!usuario) {
      return res.status(401).json({ erro: 'Usuário não encontrado!' });
    }

    if (!(await usuario.checarPassword(password))) {
      return res.status(401).json({ erro: 'Senha não confere!' });
    }

    const { id, nome, admin, imagem } = usuario;

    return res.json({
      usuario: {
        id,
        nome,
        email,
        admin,
        imagem,
      },
      token: jwt.sign({ id, admin }, authConfig.secret, {
        expiresIn: authConfig.expiresIn,
      }),
    });
  }
}

export default new SessionController();
