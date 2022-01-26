const db = require("../database/db.js");

exports.getAllDocuments = (req, res) => {
    db.query("SELECT document.*, sum(rating.mark) as mark FROM `document` left join rating on rating.document_id = document.id group by document.id", (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.postDocument = (req, res) => {
    const category_id = req.body.category_id;
    const user_id = req.body.user_id;
    const title = req.body.title;
    const mimetype = req.body.mimetype;
    const section = req.body.section;
    const drive_key = req.body.drive_key;
    const creation_date = new Date().toString();

    if(!user_id || !category_id){
        res.json({ err: "L'utilisateur ou la categorie est absente de la requête."});
    }
    
    db.query("INSERT INTO `document` (`user_id`, `category_id`, `title`, `drive_key`, `section`, `mimetype`, `creation_date`) VALUES (?, ?, ?, ?, ?, ?, ?);", 
    [user_id, category_id, title, drive_key, section, mimetype, creation_date], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}