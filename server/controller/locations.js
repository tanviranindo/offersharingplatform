const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function locations(req, res) {
  const queryString = `SELECT * FROM locations`
  db.query(queryString, (error, rows) => {
    if (!error && rows.length) {
      res.json(rows)
    } else res.status(404)
  })
}

module.exports = locations
