const db = require("../database/db.js");

exports.getAll = (req, res) => {
    db.query("SELECT * FROM class", (err, result) => {
        if (err) res.json({
            err: "Erreur(s) liée(s) à la base de données.",
            infos: err
        });
        else res.json(result);
    })
}

exports.post = (req, res) => {
    const title = req.body.title || "";
    const department_id = req.body.department_id || null;
    const semester_id = req.body.semester_id || null;
    const ics_link = req.body.ics_link || "";

    db.query("INSERT INTO `class` (`title`, `department_id`, `semester_id`, `ics_link`) VALUES (?, ?, ?, ?);",
        [title, department_id, semester_id, ics_link], (err, result) => {
            if (err) res.json({
                err: "Erreur(s) liée(s) à la base de données.",
                infos: err
            });
        else res.json(result.insertId);
    })

}

exports.update = (req, res) => {
    const id = req.body.id;
    const title = req.body.title || "";
    const department_id = req.body.department_id || null;
    const semester_id = req.body.semester_id || null;
    const ics_link = req.body.ics_link || "";

    db.query("UPDATE class set title=?, department_id=?, semester_id=?, ics_link=? where id=?",
        [title, department_id, semester_id, ics_link, id], (err, result) => {
            if (err) res.json({
                err: "Erreur(s) liée(s) à la base de données.",
                infos: err
            });
            else res.json(result);
        })
}

exports.delete = (req, res) => {
    const id = req.body.id;

    db.query("DELETE FROM class where id=?",
        [id], (err, result) => {
            if (err) res.json({
                err: "Erreur(s) liée(s) à la base de données.",
                infos: err
            });
            else res.json(result);
        })
}