import Sequelize, { Model } from 'sequelize';

class Blog extends Model {
  static init(sequelize) {
    super.init(
      {
        titulo: Sequelize.STRING,
        descricao: Sequelize.STRING,
        texto: Sequelize.STRING,
        autor: Sequelize.STRING,
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

export default Blog;
