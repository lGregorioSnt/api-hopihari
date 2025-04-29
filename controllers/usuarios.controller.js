const mysql = require('../mysql.js');

exports.UpdateUsers = async (req, res) => {
    try{
        const idusuario = Number(req.params);
        const result = await mysql.execute('UPDATE usuarios SET name =? email = ? password = ? WHERE idusuario = ?', [req.body.name, req.body.email, req.body.password, idusuario]);

    }catch (error) {
        return res.status(500).send({ error: error });
    }
}