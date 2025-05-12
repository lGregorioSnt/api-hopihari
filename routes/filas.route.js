const express = require("express");
const router = express.Router();
const login = require("../middleware/filas.middleware");8

router.post("/", () => {console.log("Rota de filas")});




module.exports = router;