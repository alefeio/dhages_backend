import Sequelize, { Model } from 'sequelize';

class Viagens extends Model {
  static init(sequelize) {
    super.init(
      {
        cidade: Sequelize.STRING,
        estado: Sequelize.STRING,
        saida: Sequelize.DATE,
        retorno: Sequelize.DATE,
        descricao: Sequelize.STRING,
        ativo: Sequelize.BOOLEAN,
        galeria: Sequelize.BOOLEAN,
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

export default Viagens;
