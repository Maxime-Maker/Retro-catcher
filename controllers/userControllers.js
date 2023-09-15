const db = require('../db');
const { StatusCodes } = require('http-status-codes');
const { createJWT } = require('../utils/tokenUtils');

const getUserCount = async (_req, res) => {
  const {
    rows: [{ count }],
  } = await db.query('SELECT COUNT (*)FROM users');

  res.status(StatusCodes.OK).json({ count });
};
const getUser = async (req, res) => {
  const {
    rows: [user],
  } = await db.query('SELECT * FROM users WHERE user_id = $1', [
    req.user.userId,
  ]);
  delete user.password;
  res.status(StatusCodes.OK).json({ user });
};

const updateUser = async (req, res) => {
  const id = req.user.userId;
  const { name } = req.body;

  const {
    rows: [user],
  } = await db.query(
    'UPDATE users SET name = $1 WHERE user_id = $2 RETURNING *',
    [name, id]
  );
  console.log(user);
  const token = createJWT({
    userId: user.user_id,
    name: user.name,
    role: user.role,
  });

  res
    .status(StatusCodes.OK)
    .json({ msg: 'Nom modifier modifié', name: user, token });
};
module.exports = { getUserCount, getUser, updateUser };
