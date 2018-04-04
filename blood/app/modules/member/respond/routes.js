var router = require('express').Router();
var db = require('../../../lib/database')();


var authMiddleware = require('../../auth/middlewares/auth');

router.get('/:id', authMiddleware.hasAuthMember, (req, res) => {
    console.log('respond get')
    var x= req.params.id;
    console.log(x);
    db.query(`SELECT * FROM post WHERE intPOST_ID=${req.params.id}`, (err, results, fields) => {
        if (err) console.log(err);
        return res.render('member/respond/views/respond', { post: results});
    });
});
router.post('/:id', authMiddleware.hasAuthMember, (req, res) => {
    console.log('respond post')
    db.query(`SELECT bool_ISDONOR FROM tblperson, tblaccounts WHERE tblperson.intACCOUNT_ID=tblaccounts.intACCOUNT_ID AND tblperson.intACCOUNT_ID=${req.session.member.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) console.log(err);
        var ans=results[0];
        req.session.ans=ans;
        console.log(ans);
        if(req.session.ans.bool_ISDONOR === 1){
            db.query(`INSERT INTO \`tblpostdonor\` ( \`intACCOUNT_ID\`, \`intPOST_ID\`)
            VALUES("${req.session.member.intACCOUNT_ID}","${req.params.id}");`, (err,results,fields) =>{
            if (err) console.log(err);
            return res.redirect('/home/member?youHaveResponded');
            });
            
        }
        else{
            res.redirect('/home/member?notADonor');
        }

    });
    
});
module.exports = router;
