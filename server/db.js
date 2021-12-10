const mariadb = require('mariadb/callback');

let _db;

const options = {
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'project_370'
}

function initializeSingleDatabase() {
  if (!_db) {
    _db = mariadb.createConnection(options)
  }
}

function getDatabaseConnection() {
  if (_db) return _db
  initializeSingleDatabase();
  return _db;
}

module.exports = { initializeSingleDatabase, getDatabaseConnection }
