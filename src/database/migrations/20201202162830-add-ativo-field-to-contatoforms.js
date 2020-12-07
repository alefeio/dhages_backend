'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('contatoforms', 'ativo', {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      defaultValue: true,
    });
  },

  down: (queryInterface) => {
    return queryInterface.removeColumn('contatoforms', 'ativo');
  },
};
