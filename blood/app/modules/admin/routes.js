var router = require('express').Router();



//router.use(authMiddleware.hasAuth);
router.use('/users', require('./users/routes'));
router.use('/account', require('./account/routes'));
router.use('/changepass', require('./changepass/routes'));
router.use('/beneficiary', require('./beneficiary/routes'));
router.use('/donor', require('./donor/routes'));
router.use('/bloodstock', require('./bloodstock/routes'));
router.use('/message', require('./message/routes'));

exports.admin = router;