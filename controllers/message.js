const db = require("../database/db.js");

exports.getMessageByTopicId = (req, res) => {
    const id = req.params.id;
    
    db.query(`SELECT * FROM message where topic_id=?`, [id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.getMessageByConvId = (req, res) => {
    const id = req.params.id;
    
    db.query(`SELECT * FROM message where conv_id=?`, [id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.postMessage = (req, res) => {
    const topic_id = req.body.topic_id;
    const conv_id = req.body.conv_id;
    const user_id = req.body.user_id;
    const text_content = req.body.text_content;
    const creation_date = new Date().toString();

    if(!user_id){
        res.json({ err: "L'utilisateur est absent de la requête."});
    }
    
    db.query("INSERT INTO `message` (`topic_id`, `user_id`, `conv_id`, `text_content`, `creation_date`) VALUES ( ?, ?, ?, ?, ?);", 
    [topic_id, user_id, conv_id, text_content, creation_date], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result.insertId);
    })
}

exports.updateMessage = (req, res) => {
    const id = parseInt(req.body.id);
    const text_content = req.body.text_content;

    db.query("UPDATE message set text_content=?, modification=modification+1 where id=?", 
    [text_content, id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.deleteMessage = (req, res) => {
    const id = parseInt(req.params.id);

    db.query("DELETE FROM message where id=?", 
    [id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}