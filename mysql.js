const mysql2 = require('mysql2');
const pool = mysql2.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    port: '3307',
    database: 'hopihari_db'
});

exports.execute = (querry, param = [], pool = pool) => {
    return new Promise((resolve, reject) => {
        pool.query(querry, param, (error, results) => {
            if (error) {
                console.log(error);
                reject(error);
            }
            else {
                resolve(results);
            }
        })
    });
}