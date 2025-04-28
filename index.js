const express = require('express');
const cors = require('cors');
const app = express();
const bodyParser = require('body-parser');
const helmet = require('helmet');

const UsuariosRoute = require('./routes/login.route');
const CadastroRoute = require('./routes/cadastro.route');
const UpdateRoute = require('./routes/update.route');

app.use(cors());
app.use(helmet());

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use((req, res, next) => { 
    res.header("Access-Control-Allow-Origin", "*" );
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

    if (req.method === 'OPTIONS') {
        res.header("Access-Control-Allow-Methods", "PUT, POST, PATCH, DELETE, GET");
        return res.status(200).json({});
    }
    next();
})

app.use('/usuarios', UsuariosRoute);
app.use('/usuarios', CadastroRoute);
app.use('/usuarios', UpdateRoute);

module.exports = app;