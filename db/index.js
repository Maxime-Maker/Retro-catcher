//* gestion de connexion base de données

const { Pool } = require('pg');

const pool = new Pool();

module.exports = {
  query: (text, params) => pool.query(text, params),
};
