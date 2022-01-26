const convert = require('xml-js');
const axios = require("axios");
const db = require("../database/db.js");
const util = require('util');
const query = util.promisify(db.query).bind(db);

/**
 * transform string to a grade
 *
 * @param {String} title
 * @return {Object} grade value and max value
*/
const getGrade = (title) => {
    if (!title) return null;
    title = title.split(":");
    if (title[2]) title = title[2].trim();
    else return null;

    let max;
    let grade;

    if (title.includes("/")) {
        grade = parseFloat(title.split("/")[0].trim());
        max = parseFloat(title.split("/")[1].trim());
    } else {
        grade = parseFloat(title);
        max = 20;
    }
    
    return {
        grade: grade,
        max: max
    };
}

/**
 * transform data fetch from tomuss into object array
 *
 * @param {String} data 
 * @return {Array} array of marks
*/
function clear_data(data) {
    if (!data) return [];

    data = JSON.parse(convert.xml2json(data));
    data = data.elements[0].elements[0].elements.filter(item => item.name == "item");

    data = data.map((item) => {
        const _title = item.elements[0]?.elements[0].text;
        const _description = item.elements[1]?.elements[0].text;
        const _creation_date = item.elements[4]?.elements[0]?.text;

        const grade = (!_description.includes("charset")) ? getGrade(_title)?.grade : NaN;
        const title = _title.split(":")[1]?.trim() || "";
        const max = getGrade(_title)?.max;

        return { 
            grade: grade,
            creation_date: new Date(_creation_date),
            description: _description,
            title: title,
            tomuss: 1, 
            max: max,
            deleted: false,
            coef: 1
         };
    })

    data = data.filter(item => (item.grade || item.grade == 0));

    return data;
}

/**
 * generates rss feed URLs for the last [nb_year] years
 *
 * @param {Sting} token (for tomuss)
 * @param {Int} nb_year number of years
 * @return {Array} array of String
*/
function get_urls({ token, nb_year }) {
    const current_year = new Date().getFullYear();

    let urls = [];

    for (let i=current_year; i>current_year-nb_year; i--) {
        urls.push(`https://tomuss.univ-lyon1.fr/S/${i}/Automne/rss/${token}`);
        urls.push(`https://tomuss.univ-lyon1.fr/S/${i}/Printemps/rss/${token}`);
    }

    return urls;
}

const fetchUserTomuss = async (props) => {
    const token = props.token || "";
    const user_id = props.user_id || 32;
    const nb_year = 3;
    const urls = get_urls({ token: token, nb_year: nb_year });
    
    let data_list = [];
    for (const url of urls) {
        let result = await axios.get(url); // get the RSS feed
        data_list.push(...clear_data(result.data)); // concatenate arrays
    }

    let marks = []

    try {
        marks = await query("SELECT * FROM mark");
    } catch (error) { console.log(error) }
    
    for (const tomuss of data_list) {
        const union = marks.find(item => (item.user_id == user_id && item.tomuss && new Date(item.creation_date).toISOString() == new Date(tomuss.creation_date).toISOString()))
        if (!union) {
            try {
                await query("INSERT INTO `mark` (`user_id`, `grade`, `creation_date`, `tomuss`, `deleted`, `max`, `description`, `title`, `coef`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
                [user_id, tomuss.grade, tomuss.creation_date, 1, 0, tomuss.max, tomuss.description, tomuss.title, tomuss.coef]);
            } catch (error) { console.log(error) }
        }
    }
}

const fetchForAllUser = async () => {
    try {
        const users = await query("select * from user");
        for (const user of users) {
            if (user.tomuss != "") {
                await fetchUserTomuss({
                    user_id: user.id,
                    token: user.tomuss
                })
            }
        }
    } catch(error) {
        console.log(error)
    }
}

exports.tom = async (req, res) => {
    console.log("ok")
    await fetchForAllUser();
    res.send({ msg : "ok"})
}

/**
 * Create an array containing the rating of a user according to his tomuss token
 *
 * @param {Object} req
 * @param {Object} res
 * @return {array} array of marks
*/
exports.getAll = async (req, res) => {
    const user_id = req.params.id;
    let marks = [];

    try {
        marks = await query("SELECT * FROM mark where deleted=0 and user_id=?", [user_id]);
    } catch (error) { console.log(error) }

    res.json(marks);
}

exports.delete = async (req, res) => {
    const id = req.body.id;
    try {
        const mark = await query("select * from mark where id=?", [id]);
        
        if (mark[0].tomuss) {
            const result = await query("UPDATE mark set deleted=1 where id=?", [id])
            res.json(result)
        } else {
            const result = await query("DELETE FROM mark where id=?", [id])
            res.json(result)
        }
    } catch(error) {
        res.json({err: error })
    }
}

exports.post = async (req, res) => {
    const body = req.body || {};

    let result = [];
    try {
        const data = await query("INSERT INTO `mark` (`user_id`, `grade`, `creation_date`, `tomuss`, `deleted`, `max`, `description`, `title`, `coef`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);",
        [body.user_id, body.grade, body.creation_date, 0, 0, body.max, body.description, body.title, body.coef]);
        result.push(data)
    } catch (error) {
        result = { err: "Erreur(s) liée(s) à la base de données.", infos: err };
    }

    res.json(result)
}

exports.update = async (req, res) => {
    const body = req.body || {};

    db.query("UPDATE mark set grade=?, max=?, description=?, title=?, coef=? where id=?",[body.grade, body.max, body.description, body.title, body.coef, body.id], (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.updateTomuss = async (req, res) => {
    const id = req.body.user_id;
    const tomuss = req.body.tomuss || "";

    try {
        await query("UPDATE user set tomuss=? where id=?",[tomuss, id])
        await fetchUserTomuss({
            user_id: id,
            token: tomuss
        })
        res.json({msg: "success"});
    } catch(err) {
        res.json({
            err: "Erreur(s) liée(s) à la base de données.",
            infos: err
        });
    }
}