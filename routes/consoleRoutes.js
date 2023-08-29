//! afficher les consoles
const { Router } = require('express');
const router = Router();

const {
  authenticateUser,
  authorizePermissions,
} = require('../middlewares/authenticationMiddleware.js');

const {
  getAllConsole,
  addNewConsole,
} = require('../controllers/consolesControllers.js');
router.use(authenticateUser);
router.route('/').get(getAllConsole);
router.route('/add').post(addNewConsole);
module.exports = router;
