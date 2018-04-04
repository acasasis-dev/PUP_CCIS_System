exports.hasAuthAdmin = (req, res, next) => {
    if (req.session && req.session.admin && Object.keys(req.session.admin).length > 0) return next();
    return res.redirect('/login?unauthorized');
}
exports.hasAuthMember = (req, res, next) => {
    if (req.session && req.session.member && Object.keys(req.session.member).length > 0) return next();
    return res.redirect('/login?unauthorized');
}
exports.hasAuthBloodBank = (req, res, next) => {
    if (req.session && req.session.bloodbank && Object.keys(req.session.bloodbank).length > 0) return next();
    return res.redirect('/login?unauthorized');
}
exports.noAuthed = (req, res, next) => {
    if (req.session && req.session.user && Object.keys(req.session.user).length > 0) return res.redirect('/');
    return next();
}

