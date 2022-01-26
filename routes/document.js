const express = require('express');
const router = express.Router();
const documentCtrl = require("../controllers/document")
const bodyParser = require('body-parser')
const security = require('../helpers/security')

router.use(bodyParser.json());

router.get("/", documentCtrl.getAllDocuments);

router.post("/", security.check_auth, documentCtrl.postDocument);

module.exports = router;