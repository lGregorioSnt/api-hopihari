const mysql = require('../mysql.js');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');


exports.UpdateUsers = async (req, res) => {
    try {
        const id = Number(req.params.id);
        const { first_name, last_name, email, password } = req.body;

        const result = await mysql.execute(
            'UPDATE users SET first_name = ?, last_name = ?, email = ?, password = ? WHERE id = ?',
            [first_name, last_name, email, password, id]
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
        const { first_name, last_name, email, password, birth_date, phone } = req.body;

        // Verifica se todos os campos obrigatórios foram fornecidos
        if (!first_name || !last_name || !email || !password || !birth_date || !phone) {
            return res.status(400).send({ error: 'Todos os campos (first_name, last_name, email, password, birth_date, phone) são obrigatórios.' });
        }

        console.log('Dados recebidos para cadastro:', req.body);

    
    
        const senhacrp = await bcrypt.hash(password, 10);

     
        const result = await mysql.execute(
            'INSERT INTO users (first_name, last_name, email, password, birth_date, phone) VALUES (?, ?, ?, ?, ?, ?)',
            [first_name, last_name, email, senhacrp, birth_date, phone]
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
exports.deleteUser = async (req, res) => {

    try {
        const result = await mysql.execute(
            'DELETE FROM users WHERE id = ?',
            [req.params.id]
        );

        if (result.affectedRows === 0) {
            return res.status(404).send({ message: 'Usuário não encontrado' });

        }

        else return res.status(200).send({
            message: 'Usuário deletado com sucesso!',
            resultado: result
        });


    }
    catch (error) {
        console.error('Erro ao deletar usuário:', error);
        return res.status(500).send({ error: 'Erro interno no servidor' });
    }
}

exports.LoginUser = async (req, res) => {
    try {
        const { email, password } = req.body;

        // Validação de entrada
        if (!email || !password) {
            return res.status(400).send({ message: 'Email e senha são obrigatórios.' });
        }

        // Busca o usuário pelo email
        const result = await mysql.execute(
            'SELECT * FROM users WHERE email = ?',
            [email]
        );

        if (result.length === 0) {
            return res.status(401).send({ message: 'Usuário não encontrado.' });
        }

        const user = result[0];

        const hash = bcrypt.hashSync(req.body.password, 10);
        const match = await bcrypt.compare(password, user.password);
        if (!match) { // Corrigido para verificar quando as senhas não coincidem
            return res.status(401).send({ message: 'Email ou senha inválidos.' });
        }

        // Gera o token JWT
        const token = jwt.sign(
            {
                id: user.id,
                email: user.email,
                first_name: user.first_name,
                last_name: user.last_name,
                birth_date: user.birth_date,
                phone: user.phone
            }, 'senhadojwt'
        );

        // Retorna sucesso
        return res.status(200).send({
            message: 'Login realizado com sucesso!',
            token: token,
            user
        });

    } catch (error) {
        console.error('Erro ao fazer login:', error);
        return res.status(500).send({ error: 'Erro interno no servidor.' });
    }
};


