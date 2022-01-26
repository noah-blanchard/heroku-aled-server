const db = require("../database/db.js");

const emailRegister = require("../email/email_register.js");
const emailPasswordReset = require("../email/email_resetpassword.js")

const {
    v4: uuidv4
} = require('uuid');

const bcrypt = require('bcrypt');
const security = require('../helpers/security')
const saltRounds = 10;


exports.getAllUsers = (req, res) => {
    db.query("SELECT * FROM user", (err, result) => {
        if (err) res.json({
            err: "Erreur(s) liée(s) à la base de données.",
            infos: err
        });
        else res.json(result);
    })
}

exports.update = (req, res) => {
    const id = req.body.id;
    const last_name = req.body.last_name;
    const first_name = req.body.first_name;
    const mail = req.body.mail;
    const icon = req.body.icon || "https://img.icons8.com/officel/1600/ffffff/user.png";
    const class_id = req.body.class_id;
    const tomuss = req.body.tomuss || "";
    const user_privilege = req.body.user_privilege || 1;

    db.query("UPDATE user set last_name=?, first_name=?, mail=?, icon=?, class_id=?, tomuss=?, user_privilege=? where id=?",
        [last_name, first_name, mail, icon, class_id, tomuss, user_privilege, id], (err, result) => {
            if (err) res.json({
                err: "Erreur(s) liée(s) à la base de données.",
                infos: err
            });
            else res.json(result);
        })
}

exports.delete = (req, res) => {
    const id = req.body.id;

    db.query("DELETE FROM user where id=?",
        [id], (err, result) => {
            if (err) res.json({
                err: "Erreur(s) liée(s) à la base de données.",
                infos: err
            });
            else res.json(result);
        })
}

// ---------------------------------------------------------

exports.getUserStatsById = (req, res) => {

    const user_id = req.params.id;

    db.query(`select u.id, count(distinct m.id) as nb_messages,
        count(distinct t.id) as nb_topic,
        count(distinct r.topic_id) as nb_notes_topic, 
        count(distinct d.id) as nb_documents,
        count(distinct r.document_id) as nb_notes_documents
        from user as u
        left outer join message as m on u.id = m.user_id
        left outer join topic as t on u.id = t.user_id
        left outer join document as d on u.id = d.user_id
        left outer join rating as r on u.id = r.user_id where u.id = ? group by u.id`,
        [user_id], (err, result) => {

            if (err) res.json({
                err: "Erreur de récupération des statistiques.",
                infos: err
            })
            else {

                res.send(result[0])

            }

        })

}

exports.editUserById = (req, res) =>{

    const user_id = parseInt(req.params.id);
console.log(req.body)

    db.query(`SELECT crypted_password, class_id, tomuss, id FROM user WHERE id=?`, [user_id], (err, result) => {

        if(err) res.json({
            err: "Utilisateur non trouvé",
            infos: err
        });
        else if(result[0]){
            const user_edit = result[0];

            
                if(req.body.password.length > 0){
                    bcrypt.compare(req.body.oldPassword, result[0].crypted_password).then(r =>{
                        console.log(r);
                        if(!r){
                            console.log("et merde...")
                            res.json({
                                err: "Mauvais mot de passe"
                            })
                            return
                        }else{
                            bcrypt.hash(req.body.password, saltRounds).then((hash) => {
                                console.log(user_edit.crypted_password)
                                user_edit.crypted_password = hash;
                                console.log(hash);
                                console.log(user_edit.crypted_password);
                                updateData(user_edit, user_id, req.body)
                            })
                        }

                    });
                }else{
                    if(!updateData(user_edit, user_id, req.body)){
                        res.json({
                            err:"Erreur d'édition",
                            infos:"Erreur"
                        })
                    };
                }

            
        }

    })

}

const updateData = (user_edit, user_id, body) => {
    if(body.class_id != user_edit.class_id){
        user_edit.class_id = body.class_id;
    }
    if(body.flux != user_edit.tomuss){
        user_edit.tomuss = body.tomuss;
    }

    console.log(user_edit);

    db.query("UPDATE user SET ? WHERE id="+user_id, user_edit, (err,result) => {
        if(err) return false;
           
        return true;

    })
}

exports.authUser = (req, res) => {
    const mail = req.body.mail;
    const password = req.body.password;

    db.query(`SELECT * FROM user where mail=?`, [mail], (err, result) => {
        if (err) res.json({
            err: "Erreur(s) liée(s) à la base de données.",
            infos: err
        });
        else if (result[0]) {
            if (result[0].verification === "TRUE") {

                bcrypt.compare(password, result[0].crypted_password).then((resultCompare) => {
                    if (!resultCompare) {
                        res.json({
                            err: "Mot de passe incorrect."
                        })
                    } else {
                        const user = result[0];
                        //user.token = security.get_token(user)
                        res.json(user);
                    }
                });
            } else {
                res.json({
                    err: "Il faut confirmer ton compte avant d'accéder à la plateforme !"
                })
            }
        } else {
            res.json({
                err: "E-mail non-trouvé."
            })
        }
    })
}


exports.createUser = (req, res) => {
    const creationDate = new Date().toString();
    const verif_id = uuidv4();

    const last_name = req.body.last_name;
    const first_name = req.body.first_name;
    const mail = req.body.mail;
    const icon = req.body.icon || "https://img.icons8.com/officel/1600/ffffff/user.png";
    const class_id = req.body.class_id;
    const favorite = req.body.favorite || [];

    bcrypt.hash(req.body.crypted_password, saltRounds).then((hash) => {
        db.query("insert into user(last_name, first_name, mail, crypted_password, user_privilege, creation_date, class_id, verification, icon) values(?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [last_name, first_name, mail, hash, 1, creationDate, class_id, verif_id, icon], (err, result) => {
                if (err) res.json({
                    err: "Erreur(s) liée(s) à la base de données.",
                    infos: err
                });
                else {
                    emailRegister.sendRegisterMail(req.body.mail, verif_id);

                    favorite.forEach(item => {
                        db.query(`INSERT INTO favorite_category (user_id, category_id) values(?,?)`, [result.insertId, item], (err, result) => {
                            if (err) res.json({
                                err: "Erreur(s) liée(s) à la base de données.",
                                infos: err
                            });
                        })
                    })
                    res.json("Utilisateur créé");

                }
            });
    });
}

exports.checkMailUser = (req, res) => {
    const mail = req.body.mail;

    db.query(`SELECT * FROM user where mail=?`, [mail], (err, result) => {
        if (result[0]) {
            res.json({
                err: "Un compte avec cette adresse mail existe déjà."
            });
        } else {
            res.json("Aucun utilisateur ne possède cette adreese mail.");
        }
    })
}

exports.confirmUser = (req, res) => {
    const verif_id = req.body.id;

    db.query("SELECT * FROM user WHERE verification = ?", [verif_id], (err, result) => {
        if (!(result[0]) || err) {
            res.json({
                err: "Erreur de vérification."
            });
        } else {
            db.query("UPDATE user SET verification = 'TRUE' WHERE id = ?", [result[0].id], (secondErr, secondResult) => {
                if (secondErr) {
                    res.json({
                        err: secondErr
                    });
                } else {
                    res.json(result[0]);
                }
            })
        }
    })
}

exports.resetPassword = (req, res) => {
    const email = req.body.email;
    const verif_id = uuidv4();

    db.query("SELECT id FROM user WHERE mail = ?", [email], (err, result) => {
        if (!(result[0]) || err) {
            res.json({
                err: "Utilisateur inexistant."
            });
        } else {

            db.query("UPDATE user SET forgot_password = ? WHERE id = ?", [verif_id, result[0].id], (secondErr, secondResult) => {
                if (secondErr) {
                    res.json({
                        err: secondErr
                    });
                } else {
                    emailPasswordReset.sendResetPasswordMail(email, verif_id);
                    res.send("Mail de réinitialisation envoyé");
                }
            })
        }
    })
}

exports.resetPasswordOn = (req, res) => {

    const password = req.body.password;
    const verif_id = req.body.verif_id;

    db.query("SELECT id FROM user WHERE forgot_password = ?", [verif_id], (err, result) => {
        if (!(result[0]) || err) {
            res.json({
                err: "Utilisateur non trouvé."
            });
        } else {
            bcrypt.hash(password, saltRounds).then((hash) => {
                db.query("UPDATE user SET forgot_password = 'FALSE', crypted_password = ? WHERE id = ?", [hash, result[0].id], (secondErr, secondResult) => {
                    if (secondErr) {
                        res.json({
                            err: secondErr
                        });
                    } else {
                        res.send("Mot de passe modifié.");
                    }
                })
            });
        }
    })
}