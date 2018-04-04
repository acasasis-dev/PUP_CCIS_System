var router = require('express').Router();
var db = require('../../../lib/database')();
var authMiddleware = require('../../auth/middlewares/auth');

router.get('/', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`SELECT * FROM tblevents WHERE intACCOUNT_ID=${req.session.bloodbank.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('bloodbank/event/views/event', { tblevents: results });
    });
});
router.get('/newevent', authMiddleware.hasAuthBloodBank, (req, res) => {
    
        res.render('bloodbank/event/views/eventform');
    
});
router.get('/viewevent', (req, res) => {
    db.query(`SELECT * FROM event`, (err, results, fields) => {
        if (err) console.log (err);
        return res.render('bloodbank/event/views/eventview', { event: results });
    });
});
router.post('/newevent', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`INSERT INTO \`tblevents\` ( \`strEVENT_DESC\`, \`strEVENT_LOCATION\`, \`dtmEVENT_DATETIME\`, \`intACCOUNT_ID\`)
    VALUES("${req.body.desc}", "${req.body.loc}", "${req.body.date}", "${req.session.bloodbank.intACCOUNT_ID}");`, (err,results,fields) =>{
    if (err) console.log(err);
    return res.redirect('/bloodbank/event');
    });
});
router.get('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    console.log('here');
    db.query(`SELECT * FROM tblevents WHERE intEVENT_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.render('bloodbank/event/views/eventform', { tblevents: results[0] });
    });
});
router.post('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    const queryString = `UPDATE tblevents SET
    strEVENT_DESC = "${req.body.desc}",
    strEVENT_LOCATION = "${req.body.loc}",
    dtmEVENT_DATETIME = "${req.body.date}"
    WHERE intEVENT_ID=${req.params.id}`;
    db.query(queryString, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/bloodbank/event');
    });
});
router.get('/:id/remove', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`DELETE FROM tblevents WHERE intEVENT_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/bloodbank/event');
    });
});
module.exports = router;