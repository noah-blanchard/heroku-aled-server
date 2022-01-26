const db = require("../database/db.js");

exports.getAllTopics = (req, res) => {
    db.query(`SELECT a.*, b.mark, message.creation_date as last_message 
    FROM (SELECT topic.id as useless_id, sum(mark) as mark FROM topic left join rating on topic.id = rating.topic_id group by topic.id) as b, 
    (SELECT topic.id as id, topic.user_id, topic.category_id, topic.title, topic.status, topic.creation_date , count(message.id) as nb_msg from TOPIC, MESSAGE WHERE topic.id = message.topic_id GROUP BY topic.id) as a 
    left join message 
    on message.id LIKE (select id from message where message.topic_id = a.id ORDER by id desc LIMIT 1) WHERE a.id=b.useless_id`, (err, result) => {
        if (err) {
            res.json({
                err: err
            });
        }
        res.json(result);
    })
}

exports.postTopic = (req, res) => {
    const user_id = req.body.user_id;
    const category_id = req.body.category_id;
    const title = req.body.title;
    const status = 1;
    const creation_date = new Date().toString();

    if(!user_id || !category_id){
        res.json({ err: "Il manque le user ou la category"});
    } else{
        db.query("INSERT INTO `topic` (`user_id`, `category_id`, `title`, `status`, `creation_date`) VALUES (?, ?, ?, ?, ?);", 
        [user_id, category_id, title, status, creation_date], (err, result) => {
            if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
            else res.json(result.insertId);
        })
    }
}

exports.deleteTopic = (req, res) => {
    const id = parseInt(req.params.id);

    db.query("DELETE FROM topic where id=?", 
    [id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}