const db = require("../database/db.js");

exports.getConversationsByUserID = (req, res) => {
    const user_id = req.params.id;

    db.query(`SELECT DISTINCT conversation.*, message.creation_date as last_message 
    from conversation 
    left join message 
    on message.id LIKE 
    (select id from message where message.conv_id = conversation.id ORDER by id desc LIMIT 1)
    WHERE (user1_id = ? or user2_id = ?)`,
     [user_id, user_id], (err, result) => {
        if(err){
            res.json({
                err: err
            })
        } else {
            res.json(result);
        }
    })
}

exports.newConversation = (req, res) => {
    const user1 = req.body.user1_id
    const user2 = req.body.user2_id;

    db.query("INSERT INTO conversation (user1_id, user2_id) VALUES (?, ?)", [user1, user2], (err, result) => {
        if(err){
            res.json({
                err: err
            })
        } else {
            res.json(result.insertId);
        }
    })
}