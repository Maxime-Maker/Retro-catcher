const { Router } = require('express');
const router = Router();
const {
  authenticateUser,
} = require('../middlewares/authenticationMiddleware.js');
const { getUserCount, getUser } = require('../controllers/userControllers.js');

router.get('/', getUserCount);
router.use(authenticateUser);
router.get('/current-user', getUser);
module.exports = router;
