const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function getAllTags(req, res) {
  const queryString = `SELECT * FROM tags`
  db.query(queryString, (error, rows) => {
    if (!error && rows.length) {
      res.json(rows)
    } else res.status(404)
  })
}

module.exports = getAllTags
