var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query('SELECT * FROM tblperson, tblaccounts WHERE tblperson.intACCOUNT_ID=tblaccounts.intACCOUNT_ID', (err, results, fields) => {
        if (err) throw err;
        return res.render('admin/users/views/index', { tblperson: results });
    });
});

router.get('/blood', authMiddleware.hasAuthAdmin, (req, res) => {
    db.query('SELECT * FROM tblbloodbank, tblaccounts WHERE tblbloodbank.intACCOUNT_ID=tblaccounts.intACCOUNT_ID', (err, results, fields) => {
        if (err) throw err;
        return res.render('admin/users/views/blood', { tblbloodbank: results });
    });
});
router.get('/faq', (req, res) => {
    
    res.sendFile(__dirname+'/views/faq.html');
});
router.get('/bb', authMiddleware.hasAuthAdmin, (req, res) => {
    
        return res.render('admin/users/views/bloodbank');
    });
router.get('/profile', authMiddleware.hasAuthAdmin, (req, res) => {
    db.query('SELECT * FROM tblcategory', (err, results, fields) => {
        console.log('shitfuck');
        if (err) throw err;
        return res.render('admin/users/views/bloodbankprofile', { tblcategory: results });
        console.log(category);
        
    });
});

router.post('/', authMiddleware.hasAuthAdmin, (req, res) => {
    db.query(`INSERT INTO \`tblaccounts\` ( \`strACCOUNT_EMAIL\`, \`strACCOUNT_PASSWORD\`, \`intACCOUNTTYPE_ID\`)
    VALUES("${req.body.email}", "${req.body.password}", 2);`, (err, results ,fields) =>{
        var x= results;
    console.log('megacryl');
    req.session.signupbloodbank=x;
    console.log(req.session.signupbloodbank.insertId);
    if (err) console.log(err);
    return res.redirect('/admin/users/profile');
});
});
router.post('/profile', authMiddleware.hasAuthAdmin, (req, res) => {
    console.log(req.session.signupbloodbank.insertId);
    db.query(`INSERT INTO \`tblbloodbank\` ( \`strBLOODBANK_NAME\`, \`strBLOODBANK_CONTACT1\`, \`strBLOODBANK_CONTACT2\`, \`strBLOODBANK_CONTACT3\`, \`strBLOODBANK_LOCATION\`, \`intCATEGORY_ID\`, \`intACCOUNT_ID\`)
    VALUES("${req.body.name}", "${req.body.contact1}", "${req.body.contact2}", "${req.body.contact3}",  "${req.body.loc}", "${req.body.category}","${req.session.signupbloodbank.insertId}");`, (err,results,fields) =>{
        if (err) throw err;
    return res.redirect('/admin/users/blood');
    });
});
router.get('/new', authMiddleware.hasAuthAdmin, (req, res) => {
    res.render('admin/users/views/form');
});

router.get('/:id', authMiddleware.hasAuthAdmin, (req, res) => {
    db.query(`SELECT * FROM tblperson WHERE intPERSON_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.render('admin/users/views/form', { tblperson: results[0] });
    });
});

router.get('/blood/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`SELECT * FROM tblcategory WHERE intCATEGORY_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('admin/users/views/form', { category: results });
        console.log(category);
    });
});
router.put('/blood/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    const queryString = `UPDATE tblbloodbank SET
    strBLOODBANK_EMAIL = "${req.body.email}"
    strBLOODBANK_NAME = "${req.body.name}",
    strBLOODBANK_LOCATION = "${req.body.loc}",
    strBLOODBANK_CONTACT1 = ${req.body.contact1},
    strBLOODABNK_CONTACT2 = ${req.body.contact2},
    strBLOODBANK_CONTACT3 = ${req.body.contact3},
    intCATEGORY_Id = ${req.body.category},
    WHERE intBLOODBANK_ID=${req.params.id}`;
    
    db.query(queryString, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/admin/users/blood');
    });
});

router.put('/:id', authMiddleware.hasAuthMember, (req, res) => {
    const queryString = `UPDATE tblperson SET
    strpersonEmail = "${req.body.email}"
    strpersonFN = "${req.body.fn}",
    strpersonMN = "${req.body.mn}",
    strpersonLN = "${req.body.ln}",
    strpersonAddress = "${req.body.address}",
    dtmpersonBday = "${req.body.date}",
    strpersonContactno = ${req.body.contact},
    WHERE intpersonId=${req.params.id}`;
    
    db.query(queryString, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/admin/users');
    });
});

router.get('/:id/remove', authMiddleware.hasAuthAdmin, (req, res) => {
    db.query(`DELETE FROM tblperson WHERE personId=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/admin/users');
    });
});
router.get('/blood/:id/remove', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`DELETE FROM tblbloodbank WHERE BLOODBANK_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/admin/users/blood');
    });
});

router.get('/', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`SELECT * FROM tblperson WHERE intPERSON_ID=${req.session.member.intPERSON_ID}`, (err, results, fields) => {
        if (err) console.log(err);
        return res.render('admin/users/views/beneficiary', {tblperson: results });
        
    });
});
router.post('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    console.log('here');
    db.query(`INSERT INTO \`tblbeneficiary\` (  \`intPERSON_ID\`)
    VALUES("${req.session.member.intPERSON_ID}");`, (err,results,fields) =>{
    if (err) throw err;
    return res.redirect('/home/member');
});
});
router.get('/stock', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query(`SELECT * FROM tblbloodcomponent`, (err, results, fields) => {
        if (err) console.log(err);
        return res.render('admin/users/views/addstock', {tblbloodcomponent: results });
        
    });
});
router.get('/addstock/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    db.query('SELECT * FROM tblbloodcomponent', (err, results, fields) => {
        if (err) console.log(err);
        return res.render('admin/users/views/addstock', { tblbloodcomponent: results });
    });
});
router.post('/addstock/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    console.log('here');
    console.log(req.params.id);
    db.query(`INSERT INTO \`tblbloodstock\` (  \`intBLOODBANK_ID\`, \`intBLOODCOMPONENT_ID\`, \`dblBLOODSTOCK_PRICE\`, \`intBLOODSTOCK_AP\`, \`intBLOODSTOCK_AN\`, \`intBLOODSTOCK_BP\`, \`intBLOODSTOCK_BN\`, \`intBLOODSTOCK_ABP\`, \`intBLOODSTOCK_ABN\`, \`intBLOODSTOCK_OP\`, \`intBLOODSTOCK_ON\`)
    VALUES("${req.params.id}", "${req.body.component}", "${req.body.price}", "${req.body.ap}", "${req.body.an}", "${req.body.bp}", "${req.body.bn}", "${req.body.abp}", "${req.body.abn}", "${req.body.op}", "${req.body.on}");`, (err,results,fields) =>{
        if (err) throw err;
    return res.redirect('/bloodbank/bloodstock');
    });
});
module.exports = router;