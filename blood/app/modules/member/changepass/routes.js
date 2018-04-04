var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT * FROM tblaccounts WHERE intACCOUNT_ID=${req.session.member.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('member/changepass/views/change', { tblaccounts: results});
    });
});
router.get('/:id', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT * FROM tblaccounts WHERE intACCOUNT_ID=${req.session.member.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('member/changepass/views/changepass', { tblaccounts: results});
    });
});
// router.post('/:id', authMiddleware.hasAuthMember, (req, res) => {
//     console.log('here');
//     const queryString = `UPDATE tblaccounts SET
//     strACCOUNT_EMAIL = "${req.body.newpass}"
//     WHERE intPERSON_ID=${req.params.id}`;

//     db.query(queryString, (err, results, fields) => {
//         if (err) throw err;
//         res.redirect('/member/profile');
//     });
// }); 
router.post('/:id', authMiddleware.hasAuthMember, (req, res) => {
    
    db.query(`SELECT * FROM tblaccounts WHERE intACCOUNT_ID="${req.session.member.intACCOUNT_ID}"`, (err, results, fields) => {
        if (err) throw err;
        if (results.length === 0) return res.redirect('/member/changepass?passwordNotCorrect');

        var user = results[0];

        if (user.strACCOUNT_PASSWORD === req.body.prevpass) {
             
            console.log(' change password');
            const queryString = `UPDATE tblaccounts SET
            strACCOUNT_PASSWORD = "${req.body.newpass}"
            WHERE intACCOUNT_ID=${req.params.id}`;
        
            db.query(queryString, (err, results, fields) => {
                if (err) throw err;
                res.redirect('/member/changepass?changePasswordSuccessful');
            });
        }
        else{
            return res.redirect('/member/changepass?passwordNotCorrect')
        }
    });
});
module.exports = router;
