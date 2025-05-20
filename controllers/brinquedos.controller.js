const mysql = require('../mysql');

exports.addBrinquedo = async (req, res) => {
    try {
        const resultado = await mysql.execute(
            `INSERT INTO rides (name, waiting_time, status, area)
            VALUES (?, ?, ?, ?);`, [
                req.body.name,
                req.body.wating_time,
                req.body.status,
                req.body.area
            ]
        );

        return res.status(201).send({
            mensagem: 'Brinquedo adicionado com sucesso',
            resultados: resultado
        });
    } catch (error) {
        return res.status(500).send({ error: 'Erro interno no servidor', detalhes: error.message });
    }
};