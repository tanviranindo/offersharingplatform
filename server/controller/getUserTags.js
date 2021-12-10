const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function getUserTags(req, res) {

  const queryString = `SELECT tags.tag_id, tags.tag_name FROM tags_relation
                       JOIN tags ON tags.tag_id=tags_relation.tag_id
                       WHERE tags_relation.c_id=${req.query.uid};`

  db.query(queryString, (error, rows) => {
    if (!error && rows.length) {
      res.json(rows)
    } else res.status(404)
  })
}

module.exports = getUserTags
