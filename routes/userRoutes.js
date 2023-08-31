const { Router } = require('express');
const router = Router();

const getAllUser = require('../controllers/userControllers.js');

router.get('/', getAllUser);

module.exports = router;
