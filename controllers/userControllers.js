const db = require('../db');
const { StatusCodes } = require('http-status-codes');

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
module.exports = { getUserCount, getUser };
