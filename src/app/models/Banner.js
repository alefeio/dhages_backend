import Sequelize, { Model } from 'sequelize';

class Banner extends Model {
  static init(sequelize) {
    super.init(
      {
        pai_id: Sequelize.INTEGER,
        url: Sequelize.STRING,
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

export default Banner;
