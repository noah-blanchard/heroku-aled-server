const express = require('express');
const router = express.Router();
const cors = require("cors");
const markCtrl = require("../controllers/rating")
const bodyParser = require('body-parser')

router.use(cors());

router.use(bodyParser.json());

router.get("/", markCtrl.getAllMarks);

router.post("/", markCtrl.postMark);

router.get("/document", markCtrl.getDocumentMarkByUserId);

router.get("/topic", markCtrl.getTopicMarkByUserId);

module.exports = router;