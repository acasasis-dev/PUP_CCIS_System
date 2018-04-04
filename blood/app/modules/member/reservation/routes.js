var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');
router.get('/', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`
        SELECT * FROM reserve, tblperson, tblaccounts 
        WHERE tblaccounts.intACCOUNT_ID=${req.session.member.intACCOUNT_ID} AND 
        tblperson.intACCOUNT_ID=tblaccounts.intACCOUNT_ID AND 
        tblperson.intPERSON_ID=reserve.intPERSON_ID`, (err, results, fields) => {
        if (err) throw err;
        console.log(results[0]);
        return res.render('member/reservation/views/reservation', { reserve: results });
    });
});
router.get('/:id', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT * FROM tblbloodcomponent, tblbloodtype`, (err, results, fields) => {
        if (err) console.log(err);
        // console.log(req.session);
        return res.render('member/reservation/views/reservationform', { tblbloodcomponent: results, tblbloodtype: results});
    });
});
router.post('/:id', authMiddleware.hasAuthMember, (req, res) => {
    
    db.query(`INSERT INTO \`tblreservation\` ( \`intACCOUNT_ID\`, \`intBLOODBANK_ID\`, \`intBLOODTYPE_ID\`, \`intBLOODCOMPONENT_ID\`, \`intQUANTITY\`)
    VALUES("${req.session.member.intACCOUNT_ID}","${req.params.id}", "${req.body.type}", "${req.body.component}", "${req.body.qty}");`, (err,results,fields) =>{
    if (err) console.log(err);
    var perid=results;
    console.log(perid);
        console.log('reservation post')
        const queryString = `UPDATE reserve SET
        bool_ISBENEFICIARY =  1
        WHERE intBLOODRESERVE_ID=${perid.insertId}`;
        db.query(queryString, (err, results, fields) => {
            if (err) console.log (err);
            db.query(`SELECT * FROM tblbeneficiary WHERE intACCOUNT_ID=${req.session.member.intACCOUNT_ID}`, (err, results, fields) => {
                if(err) console.log(err);
                if (results.length === 0){
                    db.query(`INSERT INTO tblbeneficiary (intACCOUNT_ID) VALUES ("${req.session.member.intACCOUNT_ID}")`, (err, results, fields) => {
                        if(err) console.log(err);
                        return res.redirect('/member/bloodstock');
                    })
                } else {
                    return res.redirect('/member/bloodstock');
                }
            });
            
        });
    
    });
});
router.get('/:id/remove', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`DELETE FROM tblreservation WHERE intBLOODRESERVE_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/member/reservation');
    });
});
module.exports = router;
