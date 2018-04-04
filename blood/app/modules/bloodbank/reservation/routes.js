var router = require('express').Router();
var db = require('../../../lib/database')();
var authMiddleware = require('../../auth/middlewares/auth');

router.get('/', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`SELECT * FROM reserve WHERE intACCOUNT_ID=${req.session.bloodbank.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('bloodbank/reservation/views/reservation', { reserve: results });
    });
});

router.get('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    console.log('here');
    db.query(`SELECT * FROM reserve WHERE intBLOODRESERVE_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.render('bloodbank/reservation/views/reserveform', { reserve: results[0] });
    });
});
router.post('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    const queryString = `UPDATE reserve SET
    dtmDEADLINE_DATE = "${req.body.date}"
    WHERE intBLOODRESERVE_ID=${req.params.id}`;
    db.query(queryString, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/bloodbank/reservation');
    });
});
router.get('/:id/remove', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`DELETE FROM tblreservation WHERE intBLOODRESERVE_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/bloodbank/reservation');
    });
});
module.exports = router;