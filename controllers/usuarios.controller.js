const mysql = require('../mysql.js');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');


exports.UpdateUser = async (req, res) => {
    try {
        const resultado = await mysql.execute(

            `update users 
            set first_name = ?,
            last_name = ?, 
            email = ?,
            birth_date = ?, 
            phone	= ?
             where id = ?;`,
            [
                req.body.first_name,
                req.body.last_name,
                req.body.email,
                req.body.birth_date,
                req.body.phone,
                res.locals.idUsuario
            ]

        );
        return res.status(201).send({ "mensagem": "Usuario atualizado com sucesso!" ,"resultado": resultado });

    } catch (error) {
        return res.status(500).send({ error });

    }
}



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
        return error
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
      return error
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
                phone: user.phone,
                admin: user.admin
            }, 'senhadojwt'
        );

        // Retorna sucesso
        return res.status(200).send({
            message: 'Login realizado com sucesso!',
            token: token,
            user : {
                firstname: user.first_name,
                lastname: user.last_name,
                email: user.email,
                birthdate: user.birth_date,
                phone: user.phone
              
            }   
        });

    } catch (error) {
       return error
    }
};

