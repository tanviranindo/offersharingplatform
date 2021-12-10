const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function getPost(req, res) {
  const queryString = `SELECT * FROM posts`
  db.query(queryString, (error, rows) => {
    if (!error && rows.length) {
      res.json(rows)
    } else res.status(404)
  })
}

module.exports = getPost
