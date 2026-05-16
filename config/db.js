const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '35a20yM2s!',
    database: 'peternakan_kuda'
});

module.exports = connection;