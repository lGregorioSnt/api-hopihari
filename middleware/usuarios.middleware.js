const jwt = require("jsonwebtoken");

exports.requireAuth = async (req, res, next) => {
    try {
        res.locals.idusuario = 0;

            const token = req.headers.authorization.split(" ")[1];
            const decode = jwt.decode(token, "senhadojwt");

            if (decode.id) {
                res.locals.idusuario = id;
            } else {
                return res.status(401).send({
                    message: "Token inválido",
                });
            }
    }
    catch (error) {
        return res.status(401).send({"error": "Token inválido"});

    }
}