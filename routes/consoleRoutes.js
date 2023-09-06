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
  getAllConsoleByBrandAndCategory,
} = require('../controllers/consolesControllers.js');

router.route('/').get(getAllConsole);
router.use(authenticateUser).route('/add').post(addNewConsole);
router.route('/byBrandAndCategory').get(getAllConsoleByBrandAndCategory);
module.exports = router;
