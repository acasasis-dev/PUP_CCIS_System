var router = require('express').Router();
var db = require('../../../lib/database')();
var flash = require('flash');

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`SELECT * FROM tblpoststatus`, (err, results, fields) => {
        if (err) throw err;
        var x=results;
        req.session.post=x;
        return res.render('bloodbank/poststatus/views/form', { tblpoststatus: results});
    });
});

router.post('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    const queryString = `UPDATE post SET
    intPOSTSTATUS_ID = "${req.body.status}"
    WHERE intPOST_ID=${req.params.id}`;
    db.query(queryString, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/home/bloodbank');
    });
});

module.exports = router;