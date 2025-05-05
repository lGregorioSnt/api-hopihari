const mysql = require('../mysql.js');


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

        // Executa a query SQL com os valores corretos
        const result = await mysql.execute(
            'INSERT INTO users (first_name, last_name, email, password, birth_date, phone) VALUES (?, ?, ?, ?, ?, ?)',
            [first_name, last_name, email, password, birth_date, phone]
        );

        // Retorna a resposta de sucesso
        return res.status(201).send({
            message: 'Usuário cadastrado com sucesso!',
            resultado: result
        });
    } catch (error) {
        console.error('Erro ao cadastrar usuário:', error);
        return res.status(500).send({ error: 'Erro interno no servidor' });
    }
};

exports.deleteUser = async (req, res) =>  {

  try{  const result = await mysql.execute(
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