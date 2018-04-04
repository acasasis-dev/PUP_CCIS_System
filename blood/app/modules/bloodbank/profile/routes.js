var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/', authMiddleware.hasAuthBloodBank, (req, res) => {
    console.log('here');
    db.query(`SELECT * FROM bloodbanks WHERE intACCOUNT_ID=${req.session.bloodbank.intACCOUNT_ID}`, (err, results, fields) => {
        console.log(req.session)
        if (err) console.log(err);
        return res.render('bloodbank/profile/views/profile', { bloodbanks: results});
    });
});

router.get('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    // const queryString =`DELIMITER $
    // BEGIN
    // SELECT * FROM bloodbanks WHERE intBLOODBANK_ID=${req.session.bloodbank.intBLOODBANK_ID};
    // SELECT * tbl category;
    // END$
    // DELIMITER ;`
    db.query(`SELECT * FROM bloodbanks WHERE intACCOUNT_ID=${req.session.bloodbank.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('bloodbank/profile/views/editbloodbank', { bloodbanks: results});
    });
});
router.post('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    const queryString = `UPDATE tblbloodbank SET
    strBLOODBANK_LOCATION = "${req.body.loc}",
    strBLOODBANK_CONTACT1 = "${req.body.contact1}",
    strBLOODBANK_CONTACT2 = "${req.body.contact2}",
    strBLOODBANK_CONTACT3 = "${req.body.contact3}",
    intCATEGORY_ID = ${req.body.category}
    WHERE intACCOUNT_ID=${req.session.bloodbank.intACCOUNT_ID}`;

    db.query(queryString, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/bloodbank/profile');
    });
});
module.exports = router;
