var router = require('express').Router();


// var authMiddleware = require('../auth/middlewares/auth');
// router.use(authMiddleware.hasAuthAdmin);
router.use('/bloodstock', require('./bloodstock/routes'));
router.use('/event', require('./event/routes'));
router.use('/donor', require('./donor/routes'));
router.use('/beneficiary', require('./beneficiary/routes'));
router.use('/profile', require('./profile/routes'));
router.use('/reservation', require('./reservation/routes'));
router.use('/poststatus', require('./poststatus/routes'));
router.use('/changepass', require('./changepass/routes'));
router.use('/message', require('./message/routes'));

exports.bloodbank = router;