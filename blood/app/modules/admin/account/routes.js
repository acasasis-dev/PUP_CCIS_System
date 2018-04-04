var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/', authMiddleware.hasAuthAdmin, (req, res) => {
    db.query('SELECT * FROM tbladmin, tblaccounts WHERE tbladmin.intACCOUNT_ID=tblaccounts.intACCOUNT_ID',(err, results, fields) => {
        if(err) console.log(err);
        return res.render('admin/account/views/admin', {tbladmin: results});
    });
});
router.get('/addadmin', authMiddleware.hasAuthAdmin, (req, res) => {
    res.render('admin/account/views/form');
});
router.post('/addadmin', authMiddleware.hasAuthAdmin, (req, res) => {
    db.query(`INSERT INTO \`tblaccounts\` ( \`strACCOUNT_EMAIL\`, \`strACCOUNT_PASSWORD\`, \`intACCOUNTTYPE_ID\`)
    VALUES("${req.body.email}", "${req.body.password}", 1);`, (err, results ,fields) =>{
        var x= results;
    console.log('LBC');
    req.session.signupadmin=x;
    console.log(req.session.signupadmin.insertId);
    if (err) console.log(err);
    db.query(`INSERT INTO \`tbladmin\` ( \`strADMIN_FN\`, \`strADMIN_MN\`, \`strADMIN_LN\`, \`strADMIN_CONTACT\`, \`intACCOUNT_ID\`)
        VALUES("${req.body.fn}", "${req.body.mn}", "${req.body.ln}", "${req.body.contact}","${req.session.signupadmin.insertId}");`, (err,results,fields) =>{
            if (err) throw err;
        return res.redirect('/admin/account');
        });
    });
});

module.exports = router;