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

router.route('/').get(getAllConsole);
router.use(authenticateUser).route('/add').post(addNewConsole);
module.exports = router;
