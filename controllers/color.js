const db = require("../database/db.js");

exports.getAll = (req, res) => {
    db.query("SELECT * FROM color", (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.post = (req, res) => {
  const title = req.body.title || "";
  const color = req.body.color || "#DDDDDD";
  
  db.query("INSERT INTO `color` (`title`, `color`) VALUES (?, ?);", 
  [title, color], (err, result) => {
      if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
      else res.json(result.insertId);
  })
}

exports.update = (req, res) => {
  const id = req.body.id;
  const title = req.body.title || "";
  const color = req.body.color || "#DDDDDD";
  
  db.query("UPDATE color set title=?, color=? where id=?", 
  [title, color, id], (err, result) => {
      if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
      else res.json(result);
  })
}

exports.delete = (req, res) => {
  const id = req.body.id;
  
  db.query("DELETE FROM color where id=?", 
  [id], (err, result) => {
      if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
      else res.json(result);
  })
}