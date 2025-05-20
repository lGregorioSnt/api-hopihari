const jwt = require("jsonwebtoken");

exports.required = async (req, res, next) => {
    try {
        // Verifica se o token existe
        if (!req.headers.authorization) {
            return res.status(401).send({
                message: "Token não fornecido"
            });
        }
        res.locals.admin = 0;

        const token = req.headers.authorization.split(" ")[1];
    
        const decode = jwt.verify(token, "senhadojwt");

        if (decode.id) {
            res.locals.idusuario = decode.id;
            res.locals.admin = decode.admin
            next(); 
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

exports.userRequired = async (req, res, next) => {
    try {
        if (!req.headers.authorization) {
            return res.status(401).send({
                message: "Token não fornecido"
            });
        }

        const token = req.headers.authorization.split(" ")[1];
        const decode = jwt.verify(token, "senhadojwt");

        
        if (decode.id && decode.admin === 1) {
            res.locals.idusuario = decode.id;
            res.locals.admin = decode.admin;
            return next(); // Permite o acesso para usuários comuns
        }

    

        return res.status(401).send({
            message: "Token inválido"
        });
    } catch (error) {
        return res.status(401).send({
            error: "Token inválido ou expirado"
        });
    }
};