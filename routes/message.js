const express = require('express');
const router = express.Router();
const messageCtrl = require("../controllers/message")

router.use(cors({origin: '*'}));
router.use(express.json({limit: '50mb'}));
router.use(express.urlencoded({limit: '50mb', extended: true}));

router.get("/conversation/:id", messageCtrl.getMessageByConvId);

router.get("/topic/:id", messageCtrl.getMessageByTopicId);

router.post("/", messageCtrl.postMessage);

router.put("/", messageCtrl.updateMessage);

router.delete("/:id", messageCtrl.deleteMessage);

module.exports = router;