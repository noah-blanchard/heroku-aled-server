const db = require("../database/db.js");

exports.getAllMarks = (req, res) => {
    db.query("SELECT document_id, AVG(mark) as mark from mark_document group by document_id", (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.postMark = (req, res) => {
    const user_id = req.body.user_id;
    const document_id = req.body.document_id || null;
    const topic_id = req.body.topic_id || null;
    const mark = req.body.mark;
    
    db.query(`SELECT count(*) as count from rating where user_id = ? and (document_id = ? or topic_id = ?)`,[user_id, document_id, topic_id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else if(result[0].count === 0){
            db.query(`INSERT INTO rating (user_id, document_id, topic_id, mark) values( ? , ? , ?, ? )`,[user_id, document_id, topic_id, mark], (err, result) => {
                if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
                else res.json(result);
            })
        } else{
            db.query(`UPDATE rating SET mark = ? where user_id = ? and (document_id = ? or topic_id = ?)`,[mark, user_id, document_id, topic_id], (err, result) => {
                if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
                else res.json(result);
            })
        };
    })
}

exports.getDocumentMarkByUserId = (req, res) => {
    const user_id = req.query.user_id;
    const document_id = req.query.document_id;
    db.query(`SELECT document_id, mark from rating where user_id = ? and document_id = ?`,[user_id, document_id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.getTopicMarkByUserId = (req, res) => {
    const user_id = req.query.user_id;
    const topic_id = req.query.topic_id;

    db.query(`SELECT topic_id, mark from rating where user_id = ? and topic_id = ?`,[user_id, topic_id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}