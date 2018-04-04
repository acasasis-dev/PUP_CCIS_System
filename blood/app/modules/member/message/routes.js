var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/viewmessage', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT message.intACCOUNT_ID, message.strACCOUNT_EMAIL, strMESSAGE_SUBJ, strMESSAGE_CONTENT, dtmMESSAGE_DATE FROM message, tblperson WHERE tblperson.intPERSON_ID=message.intPERSON_ID AND tblperson.intACCOUNT_ID=${req.session.member.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) console.log(err);
        res.render('member/message/views/viewmessage', {message: results});
    })
});
router.get('/createmessage', authMiddleware.hasAuthMember, (req, res) => {
    res.render('member/message/views/createmessage');
});

router.post('/createmessage', authMiddleware.hasAuthMember, (req,res) => {
    console.log('signup POST');
  
    db.query(`SELECT * FROM tblaccounts WHERE strACCOUNT_EMAIL="${req.body.email}"`, (err, results, fields) => {
        if(err) console.log(err);
        if (results.length === 0){
            return res.redirect('/member/message/createmessage?emailDoesntExist');
        }
        else {
            var x= results[0];
            
            console.log(x.intACCOUNT_ID);
            if(x.intACCOUNTTYPE_ID===1){
                db.query(`SELECT intADMIN_ID FROM tbladmin, tblaccounts WHERE tblaccounts.intACCOUNT_ID=${x.intACCOUNT_ID} AND tblaccounts.intACCOUNT_ID = tbladmin.intACCOUNT_ID`, (err, results, fields) => {
                    if(err) console.log(err);
                    var y= results[0];
                    console.log(y.intADMIN_ID)
                    db.query(`INSERT INTO \`tbladminmessage\` ( \`intACCOUNT_ID\`, \`intADMIN_ID\`, \`strMESSAGE_SUBJ\`, \`strMESSAGE_CONTENT\`)
                    VALUES("${req.session.member.intACCOUNT_ID}", "${y.intADMIN_ID}", "${req.body.subject}", "${req.body.content}");`, (err,results,fields) =>{
                    if (err) console.log(err);
                    return res.redirect('/member/message/viewmessage?messagesent');
                    });
                });
            }
            else if(x.intACCOUNTTYPE_ID===2){
                db.query(`SELECT intBLOODBANK_ID FROM tblbloodbank, tblaccounts WHERE tblaccounts.intACCOUNT_ID=${x.intACCOUNT_ID} AND tblaccounts.intACCOUNT_ID = tblbloodbank.intACCOUNT_ID`, (err, results, fields) => {
                    if(err) console.log(err);
                    var y= results[0];
                    console.log(y.intBLOODBANK_ID)
                    db.query(`INSERT INTO \`tblbloodmessage\` ( \`intACCOUNT_ID\`, \`intBLOODBANK_ID\`, \`strMESSAGE_SUBJ\`, \`strMESSAGE_CONTENT\`)
                    VALUES("${req.session.member.intACCOUNT_ID}", "${y.intBLOODBANK_ID}", "${req.body.subject}", "${req.body.content}");`, (err,results,fields) =>{
                    if (err) console.log(err);
                    return res.redirect('/member/message/viewmessage?messagesent');
                    });
                });
            }
            else{
                db.query(`SELECT intPERSON_ID FROM tblperson, tblaccounts WHERE tblaccounts.intACCOUNT_ID=${x.intACCOUNT_ID} AND tblaccounts.intACCOUNT_ID = tblperson.intACCOUNT_ID`, (err, results, fields) => {
                    if(err) console.log(err);
                    var y= results[0];
                   
                    console.log(y.intPERSON_ID)
                    db.query(`INSERT INTO \`tblmessage\` ( \`intACCOUNT_ID\`, \`intPERSON_ID\`, \`strMESSAGE_SUBJ\`, \`strMESSAGE_CONTENT\`)
                    VALUES("${req.session.member.intACCOUNT_ID}", "${y.intPERSON_ID}", "${req.body.subject}", "${req.body.content}");`, (err,results,fields) =>{
                    if (err) console.log(err);
                    return res.redirect('/member/message/viewmessage?messagesent');
                    });
                });
            }   
        }
    });
    
});
router.get('/:id', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT * FROM tblperson WHERE intACCOUNT_ID=${req.params.id}`, (err, results, fields) => {
        if (err) console.log(err);
        res.render('member/message/views/message', {tblperson: results});
    })
});
router.post('/:id', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT * FROM tblaccounts WHERE intACCOUNT_ID="${req.params.id}"`, (err, results, fields) => {
        if(err) console.log(err);
        if (results.length === 0){
            return res.redirect('/member/message/createmessage?emailDoesntExist');
        }
        else {
            var x= results[0];
            
            console.log(x.intACCOUNT_ID);
            if(x.intACCOUNTTYPE_ID===1){
                db.query(`SELECT intADMIN_ID FROM tbladmin, tblaccounts WHERE tblaccounts.intACCOUNT_ID=${x.intACCOUNT_ID} AND tblaccounts.intACCOUNT_ID = tbladmin.intACCOUNT_ID`, (err, results, fields) => {
                    if(err) console.log(err);
                    var y= results[0];
                    console.log(y.intADMIN_ID)
                    db.query(`INSERT INTO \`tbladminmessage\` ( \`intACCOUNT_ID\`, \`intADMIN_ID\`, \`strMESSAGE_SUBJ\`, \`strMESSAGE_CONTENT\`)
                    VALUES("${req.session.member.intACCOUNT_ID}", "${y.intADMIN_ID}", "${req.body.subject}", "${req.body.content}");`, (err,results,fields) =>{
                    if (err) console.log(err);
                    return res.redirect('/member/message/viewmessage?messagesent');
                    });
                });
            }
            else if(x.intACCOUNTTYPE_ID===2){
                db.query(`SELECT intBLOODBANK_ID FROM tblbloodbank, tblaccounts WHERE tblaccounts.intACCOUNT_ID=${x.intACCOUNT_ID} AND tblaccounts.intACCOUNT_ID = tblbloodbank.intACCOUNT_ID`, (err, results, fields) => {
                    if(err) console.log(err);
                    var y= results[0];
                    console.log(y.intBLOODBANK_ID)
                    db.query(`INSERT INTO \`tblbloodmessage\` ( \`intACCOUNT_ID\`, \`intBLOODBANK_ID\`, \`strMESSAGE_SUBJ\`, \`strMESSAGE_CONTENT\`)
                    VALUES("${req.session.member.intACCOUNT_ID}", "${y.intBLOODBANK_ID}", "${req.body.subject}", "${req.body.content}");`, (err,results,fields) =>{
                    if (err) console.log(err);
                    return res.redirect('/member/message/viewmessage?messagesent');
                    });
                });
            }
            else{
                db.query(`SELECT intPERSON_ID FROM tblperson, tblaccounts WHERE tblaccounts.intACCOUNT_ID=${x.intACCOUNT_ID} AND tblaccounts.intACCOUNT_ID = tblperson.intACCOUNT_ID`, (err, results, fields) => {
                    if(err) console.log(err);
                    var y= results[0];
                   
                    console.log(y.intPERSON_ID)
                    db.query(`INSERT INTO \`tblmessage\` ( \`intACCOUNT_ID\`, \`intPERSON_ID\`, \`strMESSAGE_SUBJ\`, \`strMESSAGE_CONTENT\`)
                    VALUES("${req.session.member.intACCOUNT_ID}", "${y.intPERSON_ID}", "${req.body.subject}", "${req.body.content}");`, (err,results,fields) =>{
                    if (err) console.log(err);
                    return res.redirect('/member/message/viewmessage?messagesent');
                    });
                });
            }   
        }
    });
});
module.exports = router;