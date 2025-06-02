const express = require("express");
const router = express.Router();
const usuariosController = require("../controllers/usuarios.controller");
const login = require("../middleware/usuarios.middleware");

router.put('/:id', usuariosController.UpdateUsers);
router.delete('/:id', usuariosController.deleteUser);
router.post('/Cadastrar', usuariosController.CreateUser);
router.post('/login', usuariosController.LoginUser);
router.put('/nome', usuariosController.updateUserName, login.required);


module.exports = router;
