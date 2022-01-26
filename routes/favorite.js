const express = require('express');
const router = express.Router();
const favoriteCtrl = require("../controllers/favorite")
const security = require('../helpers/security')

router.use(express.json());

router.get("/", favoriteCtrl.getAllFavorite);

router.get("/:id", favoriteCtrl.getFavoriteByUserId);

router.post("/", security.check_auth, favoriteCtrl.postFavorite);

router.delete("/", security.check_auth, favoriteCtrl.deleteFavorite);

module.exports = router;