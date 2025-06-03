const express = require("express");
const router = express.Router();
const usuariosController = require("../controllers/usuarios.controller");
const login = require("../middleware/usuarios.middleware");

router.put('/up', 
    usuariosController.UpdateUser,
    login.required );
router.delete('/:id', usuariosController.deleteUser);
router.post('/Cadastrar', usuariosController.CreateUser);
router.post('/login', usuariosController.LoginUser);



module.exports = router;