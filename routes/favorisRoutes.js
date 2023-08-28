const { Router } = require('express');
const router = Router();

const {
  authenticateUser,
  authorizePermissions,
} = require('../middlewares/authenticationMiddleware.js');

const { validateIdParam } = require('../middlewares/validationMiddleware.js');

const {
  deleteItem,
  getAllFavoris,
  deleteFavoris,
} = require('../controllers/favorisControllers.js');
router.use(authenticateUser);
router.route('/get').get(getAllFavoris);
router.route('/delete').delete(validateIdParam, deleteFavoris);
module.exports = router;
