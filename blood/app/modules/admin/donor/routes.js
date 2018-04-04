var router = require('express').Router();
var db = require('../../../lib/database')();
var flash = require('flash');

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/donorlist', authMiddleware.hasAuthAdmin, (req, res) => {
    db.query(`SELECT * FROM donor`, (err, results, fields) => {
        if (err) throw err;
        return res.render('admin/donor/views/donorlist', { donor: results});
    });
});

module.exports = router;