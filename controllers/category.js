const db = require("../database/db.js");

exports.getAll = (req, res) => {
    db.query("SELECT category.*, color.color FROM category INNER JOIN color on color.id = category.color_id;", (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.post = (req, res) => {
  const title = req.body.title || "";
  const color_id = req.body.color_id || 1;
  const category_id = req.body.category_id || null;
  const icon = req.body.icon || "";
  const _module = req.body.module || "";
  const coef = req.body.coef || 1;
  
  db.query("select max(id) max from category order by id", [], (err, result) => {
      if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
      else {
        const id = result[0].max + 1;
        db.query("INSERT INTO `category` (`title`, `color_id`, `category_id`,`icon`,`module`,`coef`, `id`) VALUES (?, ?, ?, ?, ?, ?, ?);", 
        [title, color_id, category_id, icon, _module, coef, id], (err, result) => {
            if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
            else res.json(result.insertId);
        })
      }
  })


}

exports.update = (req, res) => {
const title = req.body.title || "";
  const id = req.body.id;
  const color_id = req.body.color_id || 1;
  const category_id = req.body.category_id || null;
  const icon = req.body.icon || "";
  const _module = req.body.module || "";
  const coef = req.body.coef || 1;
  
  db.query("UPDATE category set title=?, color_id=?, category_id=?, icon=?, module=?, coef=? where id=?", 
  [title, color_id, category_id, icon, _module, coef, id], (err, result) => {
      if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
      else res.json(result);
  })
}

exports.delete = (req, res) => {
  const id = req.body.id;
  
  db.query("DELETE FROM category where id=?", 
  [id], (err, result) => {
      if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
      else res.json(result);
  })
}