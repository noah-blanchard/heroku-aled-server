const express = require('express');
const router = express.Router();
const convCtrl = require("../controllers/conversation");
const security = require('../helpers/security');

router.use(express.json());

router.get("/:id", security.check_auth, convCtrl.getConversationsByUserID);
router.post("/", convCtrl.newConversation);

module.exports = router;