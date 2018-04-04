var router = require('express').Router();
var db = require('../../../lib/database')();
var flash = require('flash');

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/donorlist', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`SELECT * FROM donor`, (err, results, fields) => {
        if (err) throw err;
        return res.render('bloodbank/donor/views/donorlist', { donor: results});
    });
});
router.get('/donorform', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`SELECT * FROM tblbloodtype`, (err, results, fields) => {
        if (err) throw err;
        return res.render('bloodbank/donor/views/donorsignup', { tblbloodtype: results });
    });
});
router.get('/adddonor', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`
        SELECT * FROM tblbloodtype;
        select tblperson.*
        from tblperson
        where tblperson.intPERSON_ID not in(
        	select intPERSON_ID
        	from donor
        )`, (err, out, fields) => {
        if (err) throw err;
        return res.render('bloodbank/donor/views/donor', { 
            types: out[0], 
            persons: out[1] 
        });
    });
});
router.post('/adddonor', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`INSERT INTO \`tbldonor\` ( \`intBLOODTYPE_ID\`, \`intPERSON_ID\`)
    VALUES("${req.body.type}", "${req.body.donor}");`, (err,results,fields) =>{
    if (err) throw err;
    
    db.query(`UPDATE tblperson SET bool_ISDONOR=1`, (err,results,fields) =>{
        if (err) throw err;
        return res.redirect('/bloodbank/donor/donorlist');
        });
    });
});
router.get('/:id/remove', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`DELETE FROM tbldonor WHERE intDONOR_ID=${req.params.id}`, (err, results, fields) => {
        if (err) console.log(err);
        res.redirect('/bloodbank/donor/donorlist');
    });
});


router.post('/donorform', (req,res) => {
    console.log('signup POST');
  
    db.query(`SELECT * FROM tblaccounts WHERE strACCOUNT_EMAIL="${req.body.email}"`, (err, results, fields) => {
        if(err) console.log(err);
        if (results.length === 0){
            db.query(`INSERT INTO \`tblaccounts\` ( \`strACCOUNT_EMAIL\`, \`strACCOUNT_PASSWORD\`,\`intACCOUNTTYPE_ID\`)
            VALUES( "${req.body.email}", "${req.body.password}", 3);`, (err,results,fields) =>{
            var x= results;
            req.session.signup=x;
            console.log(req.session.signup);
            if (err) throw err;
            db.query(`INSERT INTO \`tblperson\` (\`strPERSON_FN\`, \`strPERSON_MN\`, \`strPERSON_LN\`, \`dtmPERSON_BDAY\`, \`strPERSON_CONTACTNO\`, \`strPERSON_ADDRESS\`, \`intACCOUNT_ID\`, \`bool_ISDONOR\`)
            VALUES("${req.body.fn}", "${req.body.mn}", "${req.body.ln}", "${req.body.date}",  "${req.body.contactnum}",  "${req.body.address}", "${req.session.signup.insertId}", "1");`, (err,results,fields) =>{
            if (err) console.log(err);
            var y=results;
            req.session.donor=y;
            console.log(req.session.donor);
                    db.query(`INSERT INTO \`tbldonor\` ( \`intBLOODTYPE_ID\`, \`intPERSON_ID\`)
                    VALUES("${req.body.type}", "${req.session.donor.insertId}");`, (err,results,fields) =>{
                    if (err) console.log(err);
                    return res.redirect('/bloodbank/donor/donorlist');
                    });
                });
            });
            }
        else {
            return res.redirect('/bloodbank/donor/donorform?emailAlreadyTaken');
        }
    });
    
});
module.exports = router;
