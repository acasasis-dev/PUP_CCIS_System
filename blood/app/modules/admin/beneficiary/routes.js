var router = require('express').Router();
var db = require('../../../lib/database')();
var flash = require('flash');
var authMiddleware = require('../../auth/middlewares/auth');

router.get('/beneficiarylist', authMiddleware.hasAuthAdmin, (req, res) => {
    console.log(req.session);
    db.query(`SELECT * FROM beneficiary`, (err, results, fields) => {
        if (err) throw err;
        return res.render('admin/beneficiary/views/beneficiarylist', { beneficiary: results});
    });
});

module.exports = router;