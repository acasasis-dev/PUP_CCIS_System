var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/:id', authMiddleware.hasAuthAdmin, (req, res) => {
    console.log(req.session.admin.intACCOUNT_ID);
    db.query(`SELECT * FROM stocks WHERE intBLOODBANK_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('admin/bloodstock/views/stock1', { stocks: results});
    });
});
module.exports = router;