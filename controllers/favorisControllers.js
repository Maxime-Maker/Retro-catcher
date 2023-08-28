//! gestion des favoris
const db = require('../db');
const { BadRequestError, NotFoundError } = require('../errors');
const { StatusCodes } = require('http-status-codes');

//Recupére la liste des favoris users

// //! voir le join
const getAllFavoris = async (req, res) => {
  const { rows: consoles } = await db.query(
    'SELECT  FROM console favoris WHERE users_id=$1'[req.user.userID]
  );
};

// delete

const deleteFavoris = async (req, res) => {
  const { id } = req.params;
  const { userId } = req.user;
  if (isNaN(Number(id))) {
    throw new BadRequestError('Identifiant invalide');
  }
  const {
    rows: [deleteFavoris],
  } = await db.query('DELETE FROM favoris WHERE console_id=$1 AND userID=$2', [
    id,
    userId,
  ]);
  if (!deletedFavoris) {
    throw new NotFoundError(`Pas de console avec l'id ${id}`);
  }
  res
    .status(StatusCodes.OK)
    .json({ msg: 'Console supprimée', item: deleteFavoris });
};

module.exports = {
  deleteFavoris,
  getAllFavoris,
};
