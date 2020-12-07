import Sequelize, { Model } from 'sequelize';

class Reservas extends Model {
  static init(sequelize) {
    super.init(
      {
        nome: Sequelize.STRING,
        email: Sequelize.STRING,
        telefone: Sequelize.STRING,
        mensagem: Sequelize.STRING,
        lida: Sequelize.BOOLEAN,
        ativo: Sequelize.BOOLEAN,
      },
      {
        sequelize,
      }
    );

    return this;
  }

  static associate(models) {
    this.belongsTo(models.Viagens, { foreignKey: 'viagem_id', as: 'viagem' });
  }
}

export default Reservas;
