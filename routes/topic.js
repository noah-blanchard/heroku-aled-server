const express = require('express');
const router = express.Router();
const topicCtrl = require("../controllers/topic")
const bodyParser = require('body-parser')

router.use(express.json());

router.get("/", topicCtrl.getAllTopics);

router.post("/", topicCtrl.postTopic);

router.delete("/:id", topicCtrl.deleteTopic);

module.exports = router;