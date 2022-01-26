const db = require("../database/db.js");
const axios = require("axios");
const ical2json = require("ical2json");
const util = require('util');
const query = util.promisify(db.query).bind(db);

// --------------------------------------------------------------------------

const cash_calendar = {};
let fill = false;
// --------------------------------------------------------------------------

const getUrl = (ressource) => {
    const debut = "2020-12-24";
    const fin = "2092-01-10";
  
    return `http://adelb.univ-lyon1.fr/jsp/custom/modules/plannings/anonymous_cal.jsp?resources=${ressource}&projectId=1&calType=ical&firstDate=${debut}&lastDate=${fin}`;
}
  
const hours_two_date = (date1, date2) => Math.abs(date1 - date2) / 36e5;

const fill_db = async () => {
  try {
    const calendars = await query("SELECT * FROM calendar");

    for (const item of calendars) {
      await getScheduleByIcsId({ id: item.link, type: item.type, title: item.title })
    }
  } catch(error) {
    console.log(error)
  }
}

const cleanDate = (date_entry) => {
    date_entry = new Date(`${date_entry.slice(0,4)}-${date_entry.slice(4,6)}-${date_entry.slice(6,11)}:${date_entry.slice(11,13)}:${date_entry.slice(13,15)}`);

    let userTimezoneOffset = date_entry.getTimezoneOffset() * 60000;
    date_entry = new Date(date_entry.getTime() - userTimezoneOffset);

    return date_entry;
}

// --------------------------------------------------------------------------

const getScheduleByIcsId = async (props) => {
  props = props || {};
  const id = props.id || "9314";
  const type = props.type || "GROUP";
  const title = props.title || "TEMP";

  const base = {
    date: new Date(),
    events: [],
    type: type,
    title: title
  };

  if (cash_calendar[id] && hours_two_date(new Date(), cash_calendar[id].date) < 12) return cash_calendar[id];

  try {
    const response = await axios.get(getUrl(id));
    if (response.status != 200) return base;

    const json = ical2json.convert(response.data);
    let data = [];
    if (json["VCALENDAR"]) data = json["VCALENDAR"][0]["VEVENT"];

    data = data.map(opt => {
        return {
            summary : opt.SUMMARY || "",
            start : cleanDate(opt.DTSTART),
            end : cleanDate(opt.DTEND),
            location : opt.LOCATION,
            description : opt.DESCRIPTION
        }
    });

    cash_calendar[id] = {
      date: new Date(),
      events: data,
      type: type,
      title: title
    }

    return cash_calendar[id];
  } catch (err) {
    console.log(err)
    return base;
  }
}

const search = (props) => {
  const date = props.date;
  const type = props.type;
  const room_result = [];
  
  for (const [key, item] of Object.entries(cash_calendar)) {
    let operation = true;
    if (item.type.slice(0, 4).localeCompare("ROOM")) operation = false;

    if (props.type != "" && type != item.type) operation = false;
    const event = item.events.find(element => element.start <= date && element.end >= date)
    
    if (event) operation = false;
    if (operation) room_result.push({
        title: item.title,
        link: key,
        type: item.type
    });
  }

  return room_result;
}

// --------------------------------------------------------------------------

exports.getAll = (req, res) => {
    db.query("SELECT * FROM calendar", (err, result) => {
        if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
        else res.json(result);
    })
}

exports.post = (req, res) => {
  const title = req.body.title || "";
  const type = req.body.type || "GROUP";
  const link = req.body.link || "";
  
  db.query("INSERT INTO `calendar` (`title`, `link`, `type`) VALUES (?, ?, ?);", 
  [title, link, type], (err, result) => {
      if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
      else res.json(result.insertId);
  })
}

exports.update = (req, res) => {
  const id = req.body.id;
  const title = req.body.title || "";
  const type = req.body.type || "GROUP";
  const link = req.body.link || "";
  
  db.query("UPDATE calendar set title=?, type=?, link=? where id=?", 
  [title, type, link, id], (err, result) => {
      if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
      else res.json(result);
  })
}

exports.delete = (req, res) => {
  const id = req.body.id;
  
  db.query("DELETE FROM calendar where id=?", 
  [id], (err, result) => {
      if (err) res.json({ err: "Erreur(s) liée(s) à la base de données.", infos: err });
      else res.json(result);
  })
}

// --------------------------------------------------------------------------

exports.search = async (req, res) => {
    const date = req.query.date;
    const hour = req.query.hour;
    const type = req.query.type || "";

    if (!fill) { 
      fill = true; 
      await fill_db(); 
    }

    const event = new Date(`${date}T${hour}:00.000Z`);
    let userTimezoneOffset = event.getTimezoneOffset() * 60000;
    let date_final = new Date(event.getTime() + userTimezoneOffset);
  
    res.json(search({ date: date_final, type: type }));
}

exports.ics = async (req, res) => {
    const id = req.params.id;

    const result = await getScheduleByIcsId({ id: id });
  
    res.json(result.events);
}

exports.test = async (req,res) => {
  await fill_db();
  res.send("ok");
}
