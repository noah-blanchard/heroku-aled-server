const express = require('express');
const router = express.Router();
const ctrl = require("../controllers/class");
const security = require('../helpers/security');

router.use(express.json());

router.use(cors({origin: '*'}));

router.get("/", ctrl.getAll);
router.post("/", security.check_admin, ctrl.post);
router.delete("/", security.check_admin, ctrl.delete);
router.put("/", security.check_admin, ctrl.update);

module.exports = router;