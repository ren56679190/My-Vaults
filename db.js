function msql(sql, val, fn){
    const mysql = require('mysql');

    const conn = mysql.createConnection({
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'root',
        database: 'message'
    });
    conn.connect();
    conn.query(sql, val, fn);
    conn.end();
}

module.exports = {
    msql
}
