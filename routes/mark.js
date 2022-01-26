const express = require('express');
const router = express.Router();
const ctrl = require("../controllers/mark");

router.use(express.json());

router.get("/user/:id", ctrl.getAll);
router.put("/user", ctrl.updateTomuss)
router.post("/", ctrl.post);
router.delete("/", ctrl.delete);
router.put("/", ctrl.update);

router.get("/tom", ctrl.tom);
module.exports = router;