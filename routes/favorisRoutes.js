const { Router } = require('express');
const router = Router();

const {
  authenticateUser,
} = require('../middlewares/authenticationMiddleware.js');

const { validateIdParam } = require('../middlewares/validationMiddleware.js');

const {
  getAllFavoris,
  addFavoris,
  deleteFavoris,
} = require('../controllers/favorisControllers.js');
router.use(authenticateUser);
router.route('/').get(getAllFavoris).post(addFavoris);
router.route('/:id').delete(validateIdParam, deleteFavoris);

module.exports = router;
