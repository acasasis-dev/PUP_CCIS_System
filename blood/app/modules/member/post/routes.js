var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.use( authMiddleware.hasAuthMember )

router.get('/newpost', (req, res) => {
    console.log(req.session);
    db.query(`SELECT * FROM tblbloodcomponent, tblbloodtype`, (err, results, fields) => {
        var x=results;
        console.log(x);
        if (err) console.log(err);
        return res.render('member/post/views/postform', { tblbloodcomponent: results, tblbloodtype: results});
    });
});
// router.get('/:id/remove', authMiddleware.hasAuthBloodBank, (req, res) => {
//     db.query(`DELETE FROM tblbeneficiary WHERE intBENEFICIARY_ID=${req.params.id}`, (err, results, fields) => {
//         if (err) console.log(err);
//         res.redirect('/bloodbank/beneficiary/beneficiarylist');
//     });
// });
router.post('/newpost', (req, res) => {
    
    db.query(`INSERT INTO \`tblpost\` ( \`intACCOUNT_ID\`, \`intBLOODTYPE_ID\`, \`intBLOODCOMPONENT_ID\`, \`strPOST_CONTENT\`, \`intPOSTSTATUS_ID\`)
    VALUES("${req.session.member.intACCOUNT_ID}", "${req.body.type}", "${req.body.component}", "${req.body.content}", 1);`, (err,results,fields) =>{
    if (err) console.log(err);
    var perid=results;
        const queryString = `UPDATE post SET
        bool_ISBENEFICIARY =  1
        WHERE intPOST_ID=${perid.insertId}`;
        db.query(queryString, (err, results, fields) => {
            if (err) console.log (err);
            db.query(`SELECT * FROM tblbeneficiary WHERE intACCOUNT_ID=${req.session.member.intACCOUNT_ID}`, (err, results, fields) => {
                if(err) console.log(err);
                if (results.length === 0){
                    db.query(`INSERT INTO tblbeneficiary (intACCOUNT_ID) VALUES ("${req.session.member.intACCOUNT_ID}")`, (err, results, fields) => {
                        if(err) console.log(err);
                        return res.redirect('/home/member');
                    })
                } else {
                    return res.redirect('/home/member');
                }
            });
            
        });
    
    });
});

router.get( "/myposts", ( req, res ) => {
    const q = `select * from post where intACCOUNT_ID=${req.session.user.intACCOUNT_ID}`

    db.query( q, ( err, out ) => {
        res.render( "", {
            posts: out
        })
    })
})

module.exports = router;