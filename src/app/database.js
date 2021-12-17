const mysql = require('mysql2');

const { MYSQL_HOST, MYSQL_PORT, MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD, } = require('./config');

const connections = mysql.createPool({
    host: MYSQL_HOST,
    port: MYSQL_PORT,
    user: MYSQL_USER,
    password: MYSQL_PASSWORD,
    database: MYSQL_DATABASE,
    queueLimit: 10
})


connections.getConnection((err, conn) => {
    conn.connect(err2 => {
        if (err2) {
            console.log('连接失败');
            return;
        }
        console.log('连接成功');
    })
})

module.exports = connections.promise();