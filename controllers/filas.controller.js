    const mysql = require('../mysql');


    exports.verificarBrinquedo = async (req, res, next) => {
        try {
            const resultado = await mysql.execute(`
            SELECT * FROM rides WHERE id = ?;
            `, [req.params.idRide]);

            if (resultado.length === 0) {
                return res.status(404).send({ "messagem": 'Brinquedo não encontrado' });
            }
            next();
        }
        catch (error) {
            return res.status(500).send(error);
        }
    }


    exports.entrarFila = async (req, res, next) => {
        try {
            const resultados = await mysql.execute(`
                INSERT INTO hopihari_db.lines (users_id, rides_id) VALUES (?,?)
                `, [res.locals.idusuario, Number(req.params.idRide)]);

            return res.status(200).send({
                message: 'Entrou na fila com sucesso',
                resultado: resultados
            });
        } catch (error) {
            return res.status(500).send({ error: 'Erro interno no servidor' });
        }
    }