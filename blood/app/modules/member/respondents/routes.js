var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');
router.get('/', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT * FROM respondents WHERE intACCOUNT_ID=${req.session.member.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('member/respondents/views/respondents', { respondents: results });
    });
});

router.get('/:id/remove', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`DELETE FROM tblpostdonor WHERE intPDONOR_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/member/respondents');
    });
});
module.exports = router;
