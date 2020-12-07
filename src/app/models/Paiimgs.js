import Sequelize, { Model } from 'sequelize';

class Paiimgs extends Model {
  static init(sequelize) {
    super.init(
      {
        descricao: Sequelize.STRING,
        pai_id: Sequelize.INTEGER,
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

export default Paiimgs;
