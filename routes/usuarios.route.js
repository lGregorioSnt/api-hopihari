const express = require('express');
const router = express.Router();

// Rota de login
router.post('/login', (req, res) => {
    console.log('Rota de Login');
    res.status(200).json({ message: 'Login realizado com sucesso!' });
});

// Rota de cadastro
router.post('/', (req, res) => {
    console.log('Rota de cadastro');
    res.status(201).json({ message: 'Usuário cadastrado com sucesso!' });
});

// Rota de update
router.put('/', (req, res) => {
    console.log('Rota de update');
    res.status(200).json({ message: 'Usuário atualizado com sucesso!' });
});

module.exports = router;