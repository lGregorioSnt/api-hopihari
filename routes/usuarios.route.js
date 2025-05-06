const express = require("express");
const router = express.Router();
const usuariosController = require("../controllers/usuarios.controller");

router.put('/:id', usuariosController.UpdateUsers);
router.delete('/:id', usuariosController.deleteUser);
router.post('/Cadastrar', usuariosController.CreateUser);
router.post('/login', usuariosController.LoginUser);

module.exports = router;
