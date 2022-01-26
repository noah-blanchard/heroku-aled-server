const express = require('express');
const router = express.Router();
const cors = require("cors");
const ctrl = require("../controllers/calendar")

router.use(express.json());

router.use(cors({origin: '*'}));

router.get("/", ctrl.getAll);
router.post("/", ctrl.post);
router.delete("/", ctrl.delete);
router.put("/", ctrl.update);

router.get("/search", ctrl.search); // retourne une liste de salle
router.get("/ics/:id", ctrl.ics); // retourne une liste d'évenement
router.get("/test", ctrl.test);

// http://localhost:5000/api/calendar/ics/118

// http://localhost:5000/api/calendar/search?date=2022-01-03&hour=08:00&type=CLASS_INFO

module.exports = router;