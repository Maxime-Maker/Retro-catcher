//! recherche console
const db = require('../db');
const { StatusCodes } = require('http-status-codes');

const getAllConsole = async (_req, res) => {
  const { rows: consoles } = await db.query('SELECT * FROM consoles');
  res.status(StatusCodes.OK).json({ count: items.length, consoles });
};

module.exports = { getAllConsole };
// ! formulaire pour l'ajout
