const db = require('../db');
const { StatusCodes } = require('http-status-codes');

const getAllUser = async (_req, res) => {
  const { users } = await db.query('SELECT * FROM users');
  res.status(StatusCodes.OK).json({ count: users.length, users });
};

module.exports = getAllUser;
