//! afficher les consoles
const { Router } = require('express');
const router = Router();

const {
  authenticateUser,
  authorizePermissions,
} = require('../middlewares/authenticationMiddleware.js');

const { getAllConsole } = require('../controllers/consolesControllers.js');
router.use(authenticateUser);
router.route('/get').get(getAllConsole);
module.exports = router;
