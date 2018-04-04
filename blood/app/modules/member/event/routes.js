var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/viewevent', (req, res) => {
    db.query(`SELECT * FROM event`, (err, results, fields) => {
        if (err) console.log (err);
        return res.render('member/event/views/event', { event: results });
    });
});
module.exports = router;
