//! gestion des favoris
const db = require('../db');
const { BadRequestError, NotFoundError } = require('../errors');
const { StatusCodes } = require('http-status-codes');

//Recupére la liste des favoris users

// //! voir le join
const getAllFavoris = async (req, res) => {
  const { rows: consoles } = await db.query(
    'SELECT * FROM consoles JOIN favoris USING(console_id) WHERE favoris.user_id=$1',
    [req.user.userId]
  );
  res.status(StatusCodes.OK).json({ count: consoles.length, consoles });
};

const addFavoris = async (req, res) => {
  const { id } = req.body;
  const {
    rows: [favoris],
  } = await db.query(
    'INSERT INTO favoris (user_id,console_id) VALUES ($1,$2) RETURNING * ',
    [req.user.userId, id]
  );
  res.status(StatusCodes.OK).json({ favoris });
};

// delete

const deleteFavoris = async (req, res) => {
  const { id } = req.params;
  const { userId } = req.user;
  if (isNaN(Number(id))) {
    throw new BadRequestError('Identifiant invalide');
  }
  const {
    rows: [deletedFavoris],
  } = await db.query(
    'DELETE  FROM favoris WHERE console_id=$1 AND user_id=$2 RETURNING *',
    [id, userId]
  );
  if (!deletedFavoris) {
    throw new NotFoundError(`Pas de console avec l'id ${id}`);
  }
  res
    .status(StatusCodes.OK)
    .json({ msg: 'Console supprimée', item: deletedFavoris });
};

module.exports = {
  deleteFavoris,
  getAllFavoris,
  addFavoris,
};
