const jwt = require('jsonwebtoken');
const SECRET_KEY = process.env.SECRET_KEY;

const get_token = (user) => {
    user = user || {};

    const json = {
        user_privilege: user.user_privilege,
        user_id: user.id,
        generation_date: Date.now()
    }

    const token = jwt.sign(json, SECRET_KEY, { expiresIn: '7d' });

    return token;
}

const check_admin = (req, res, next) => {
    const token = req.headers.authorization || "";

    const decodedToken = jwt.decode(token, {
        complete: true
    });

    const json = decodedToken?.payload;

    next();

    // if (json && json.user_privilege == 2) {
    //     next();
    // } else {
    //     throw { name: "UnauthorizedError" };
    // }
}

const check_auth = (req, res, next) => {
    const token = req.headers.authorization || "";

    const decodedToken = jwt.decode(token, {
        complete: true
    });

    const json = decodedToken?.payload;


    next();

    // if (json && json.user_privilege && json.user_id) {
    //     next();
    // } else {
    //     throw { name: "UnauthorizedError" };
    // }
}

const check_id = (req, res, next) => {
    const token = req.headers.authorization || "";

    const decodedToken = jwt.decode(token, {
        complete: true
    });

    const json = decodedToken?.payload;

    next();

    // if (json && json.user_privilege == 2) {
    //     next();
    // } else if (json && json.user_id == req.body.user_id) {
    //     next();
    // } else {
    //     throw { name: "UnauthorizedError" };
    // }
}

module.exports = {
    check_id,
    check_auth,
    check_admin,
    get_token
};