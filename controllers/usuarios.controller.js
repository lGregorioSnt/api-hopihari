const mysql = require('../mysql.js');

exports.UpdateUsers = async (req, res) => {
    try {
      
        const id = Number(req.params.id);

        const result = await mysql.execute(
            'UPDATE users SET name = ?, email = ?, password = ? WHERE id = ?',
            [req.body.name, req.body.email, req.body.password, id]
        );

        return res.status(200).send({
            message: 'Usuário atualizado com sucesso!',
            resultado: result
        });
    } catch (error) {
      
        console.error('Erro ao atualizar usuário:', error);
        return res.status(500).send({ error: 'Erro interno no servidor' });
    }
    
};


exports.CreateUser = async (req, res) => {
    try {
    
        const { name, email, password } = req.body;

     
        if (!name || !email || !password) {
            return res.status(400).send({ error: 'Todos os campos (name, email, password) são obrigatórios.' });
        }

        console.log('Dados recebidos para cadastro:', req.body);

       
        const result = await mysql.execute(
            'INSERT INTO users (name, email, password) VALUES (?, ?, ?)',
            [name, email, password]
        );

      
        return res.status(201).send({
            message: 'Usuário cadastrado com sucesso!',
            resultado: result
        });
        
    } catch (error) {
       
        console.error('Erro ao cadastrar usuário:', error);
        return res.status(500).send({ error: 'Erro interno no servidor' });
    }
};