require('dotenv/config');

module.exports = {
  dialect: 'postgres',
  host: 'localhost',
  username: 'postgres',
  password: 'docker',
  database: 'dhages',
  define: {
    timestamps: true,
    underscored: true,
    underscoredAll: true,
  },
};
