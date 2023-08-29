//! recherche console
const db = require('../db');
const { StatusCodes } = require('http-status-codes');

const getAllConsole = async (_req, res) => {
  const { rows: consoles } = await db.query('SELECT * FROM consoles');
  res.status(StatusCodes.OK).json({ count: consoles.length, consoles });
};

// ! formulaire pour l'ajout

const addNewConsole = async (req, res) => {
  const { name, brand, release, type, about, img } = req.body;
  const { rows: consoles } = await db.query(
    'INSERT INTO consoles(name_console,brand,release_date,type_console,about,url_image) VALUES($1,$2,$3,$4,$5,$6) RETURNING *',
    [name, brand, release, type, about, img]
  );
  res.status(StatusCodes.OK).json({ consoles });
};

module.exports = { getAllConsole, addNewConsole };
