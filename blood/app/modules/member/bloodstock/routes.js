var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`
        SELECT
            tblbloodbank.*,
            geo_locations.gloc_link
        FROM 
            tblbloodbank, 
            geo_locations
        where tblbloodbank.intBLOODBANK_ID=geo_locations.intBLOODBANK_ID`, (err, results, fields) => {
        if (err) throw err;
        console.log(results);
        return res.render('member/bloodstock/views/bloodbanks', { tblbloodbank: results});
    });
});
router.get('/view',  (req, res) => {
    db.query(`SELECT * FROM tblbloodbank `, (err, results, fields) => {
        if (err) throw err;
        console.log(req.session);
        return res.render('member/bloodstock/views/bloodbank1', { tblbloodbank: results});
    });
});
router.get('/view/:id', (req, res) => {
    db.query(`SELECT * FROM stocks, tblbloodbank WHERE stocks.intBLOODBANK_ID="${req.params.id}" AND tblbloodbank.intBLOODBANK_ID=stocks.intBLOODBANK_ID`, (err, results, fields) => {
        if (err) throw err;
        console.log(req.session);
        return res.render('member/bloodstock/views/stock2', { stock: results});
    });
});
router.get('/:id', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT * FROM stocks, tblbloodbank WHERE stocks.intBLOODBANK_ID="${req.params.id}" AND tblbloodbank.intBLOODBANK_ID=stocks.intBLOODBANK_ID`, (err, results, fields) => {
        if (err) throw err;
        console.log(req.session);
        return res.render('member/bloodstock/views/stock1', { stock: results});
    });
});
module.exports = router;
