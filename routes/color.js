const express = require('express');
const router = express.Router();
const ctrl = require("../controllers/color")
const bodyParser = require('body-parser')
const security = require('../helpers/security');

router.use(bodyParser.json());

router.use(cors({origin: '*'}));

router.get("/", ctrl.getAll);
router.post("/", security.check_admin, ctrl.post);
router.delete("/", security.check_admin, ctrl.delete);
router.put("/", security.check_admin, ctrl.update);

module.exports = router;