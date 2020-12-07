import Sequelize, { Model } from 'sequelize';

class Ondeestamos extends Model {
  static init(sequelize) {
    super.init(
      {
        responsavel: Sequelize.STRING,
        email: Sequelize.STRING,
        telefone: Sequelize.STRING,
        cep: Sequelize.STRING,
        rua: Sequelize.STRING,
        numero: Sequelize.INTEGER,
        complemento: Sequelize.STRING,
        bairro: Sequelize.STRING,
        cidade: Sequelize.STRING,
        uf: Sequelize.STRING,
        ativo: Sequelize.BOOLEAN,
        mapa: Sequelize.STRING,
      },
      {
        sequelize,
      }
    );

    return this;
  }

  static associate(models) {
    this.belongsTo(models.File, { foreignKey: 'img_id', as: 'imagem' });
    this.belongsTo(models.Usuario, { foreignKey: 'usuario_id', as: 'usuario' });
  }
}

export default Ondeestamos;
