const express = require("express");
const router = express.Router();
const login = require("../middleware/usuarios.middleware");

router.post("/", () => {console.log("Rota de filas")});




module.exports = router;