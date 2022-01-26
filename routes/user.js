const express = require('express');
const cors = require("cors");
const router = express.Router();
const ctrl = require("../controllers/user")
const security = require('../helpers/security')

const errorHandler = require('../helpers/error-handler');
router.use(errorHandler);
router.use(express.json());
router.use(cors());



router.get("/", ctrl.getAllUsers);
router.post("/", security.check_id, ctrl.createUser);
router.delete("/", security.check_id, ctrl.delete);
router.put("/", security.check_id, ctrl.update);

router.get("/stats/:id", ctrl.getUserStatsById)
router.post("/auth", ctrl.authUser);
router.post("/verification", ctrl.confirmUser);
router.post("/resetpassword", ctrl.resetPassword);
router.post("/resetpasswordon", ctrl.resetPasswordOn);
router.post("/checkemail", ctrl.checkMailUser);
router.put("/edit/:id", ctrl.editUserById);


module.exports = router;