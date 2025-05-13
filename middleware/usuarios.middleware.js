const jwt = require("jsonwebtoken");

exports.required = async (req, res, next) => {
    try {
        // Verifica se o token existe
        if (!req.headers.authorization) {
            return res.status(401).send({
                message: "Token não fornecido"
            });
        }

        const token = req.headers.authorization.split(" ")[1];
        
        // Use verify em vez de decode para validar o token
        const decode = jwt.verify(token, "senhadojwt");

        if (decode.id) {
            res.locals.idusuario = decode.id;
            next(); // Chama o próximo middleware
        } else {
            return res.status(401).send({
                message: "Token inválido"
            });
        }
    }
    catch (error) {
        return res.status(401).send({
            "error": "Token inválido ou expirado"
        });
    }
}