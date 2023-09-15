const { Router } = require('express');
const router = Router();
const {
  authenticateUser,
} = require('../middlewares/authenticationMiddleware.js');
const {
  getUserCount,
  getUser,
  updateUser,
} = require('../controllers/userControllers.js');
const {
  validateUpdateItemInput,
  validateUpdateUser,
} = require('../middlewares/validationMiddleware.js');

router.get('/', getUserCount);
router.use(authenticateUser);
router.get('/current-user', getUser);
router.put('/update-user', validateUpdateUser, updateUser);
module.exports = router;
