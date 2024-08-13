const mysql = require('mysql2/promise');

const mysqlPool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'setup_dragons_db',
  connectionLimit: 10
});

module.exports = mysqlPool;
