const mysql = require('../mysql');

exports.entrarfila = async (req, res, next) => {
    try{
        const resultados  = await mysql.execute(`
            INSERT INTO lines (id_user, id_rides,) VALUES (?,?)
            `, [res.locals.idusuario, req.body.idRide]);
    
        return res.status(200).send({
            message: 'Entrou na fila com sucesso',
            resultado: resultados
        });
    } catch (error) {
        return res.status(500).send({ error: 'Erro interno no servidor' });
    }

}