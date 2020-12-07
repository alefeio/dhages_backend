import Sequelize, { Model } from 'sequelize';

class Cidades extends Model {
  static init(sequelize) {
    super.init(
      {
        nome: Sequelize.STRING,
        ativo: Sequelize.BOOLEAN,
      },
      {
        sequelize,
      }
    );

    return this;
  }

  static associate(models) {
    this.belongsTo(models.Usuario, { foreignKey: 'usuario_id', as: 'usuario' });
    this.belongsTo(models.File, { foreignKey: 'img_id', as: 'imagem' });
  }
}

export default Cidades;
