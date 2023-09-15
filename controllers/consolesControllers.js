//! recherche console
const db = require('../db');
const { StatusCodes } = require('http-status-codes');

const getAllConsole = async (_req, res) => {
  const { rows: consoles } = await db.query('SELECT * FROM consoles');
  res.status(StatusCodes.OK).json({ count: consoles.length, consoles });
};

const getAllConsoleByBrandAndCategory = async (req, res) => {
  const { rows: consoles } = await db.query(
    'SELECT * FROM consoles  WHERE console_id NOT IN (select console_id FROM favoris WHERE user_id=$1) ORDER BY type_console, brand,name_console',
    [req.user.userId]
  );
  const groupedConsoles = consoles.reduce((acc, console) => {
    const brand = console.brand;
    const consoleType = console.type_console;

    if (!acc[consoleType]) {
      acc[consoleType] = {};
    }
    if (!acc[consoleType][brand]) {
      acc[consoleType][brand] = [];
    }
    acc[consoleType][brand].push(console);

    return acc;
  }, {});

  res.status(StatusCodes.OK).json({ consoles: groupedConsoles });
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

module.exports = {
  getAllConsole,
  addNewConsole,
  getAllConsoleByBrandAndCategory,
};
