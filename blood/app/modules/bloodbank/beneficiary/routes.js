var router = require('express').Router();
var db = require('../../../lib/database')();
var flash = require('flash');
var authMiddleware = require('../../auth/middlewares/auth');

router.get('/beneficiarylist', authMiddleware.hasAuthBloodBank, (req, res) => {
    console.log(req.session);
    db.query(`SELECT * FROM beneficiary`, (err, results, fields) => {
        if (err) throw err;
        return res.render('bloodbank/beneficiary/views/beneficiarylist', { beneficiary: results});
    });
});
router.get('/:id/remove', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`DELETE FROM tblbeneficiary WHERE intBENEFICIARY_ID=${req.params.id}`, (err, results, fields) => {
        if (err) console.log(err);
        res.redirect('/bloodbank/beneficiary/beneficiarylist');
    });
});
module.exports = router;