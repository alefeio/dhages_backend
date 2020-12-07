import Sequelize from 'sequelize';

import Blog from '../app/models/Blog';
import Cidades from '../app/models/Cidades';
import Contatoforms from '../app/models/Contatoforms';
import Reservas from '../app/models/Reservas';
import File from '../app/models/File';
import Locais from '../app/models/Locais';
import Ondeestamos from '../app/models/Ondeestamos';
import Paidetalhes from '../app/models/Paidetalhes';
import Paiimgs from '../app/models/Paiimgs';
import Banner from '../app/models/Banner';
import Usuario from '../app/models/Usuario';
import Viagens from '../app/models/Viagens';

import databaseConfig from '../config/database';

const models = [
  Blog,
  Cidades,
  Contatoforms,
  Reservas,
  File,
  Locais,
  Ondeestamos,
  Paidetalhes,
  Paiimgs,
  Banner,
  Usuario,
  Viagens,
];

class Database {
  constructor() {
    this.init();
  }

  init() {
    this.connection = new Sequelize(databaseConfig);

    models
      .map((model) => model.init(this.connection))
      .map(
        (model) => model.associate && model.associate(this.connection.models)
      );
  }
}

export default new Database();
