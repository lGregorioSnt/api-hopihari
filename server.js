const http = require('http');
const app = require('./index.js');

const server = http.createServer(app);
server.listen(3001, () => {
    console.log('server rodando na 3001');
});

module.exports = app;
