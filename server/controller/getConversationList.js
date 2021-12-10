const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function getConversationList(req, res) {
  
  const query = `SELECT unique users.name, to_uid FROM messages left JOIN users ON users.uid=to_uid WHERE from_uid=${req.query.uid}`

  db.query(query, (error, rows) => {
    if (!error && rows.length) {
      res.json(rows)
    } else res.status(404)
  })
}

module.exports = getConversationList
