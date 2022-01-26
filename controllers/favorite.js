const db = require("../database/db.js");

exports.getAllFavorite = (req, res) => {
    db.query("SELECT * FROM favorite_category", (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.getFavoriteByUserId = (req, res) => {
    const user_id = req.params.id;

    db.query(`SELECT * FROM favorite_category where user_id= ?`,[user_id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.postFavorite = (req, res) => {
    const user_id = req.body.user_id;
    const category_id = req.body.category_id;
    
    db.query(`INSERT INTO favorite_category (user_id, category_id) values(?, ?)`,[user_id, category_id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.deleteFavorite = (req, res) => {
    const user_id = req.body.user_id;
    const category_id = req.body.category_id;
    
    db.query(`DELETE FROM favorite_category where user_id=? and category_id = ?`,[user_id, category_id] ,(err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}