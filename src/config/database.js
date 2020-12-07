require('dotenv/config');

module.exports = {
  dialect: 'postgres',
  host: process.env.BD_HOST,
  username: process.env.BD_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  port: 3333,
  define: {
    timestamps: true,
    underscored: true,
    underscoredAll: true,
  },
};
