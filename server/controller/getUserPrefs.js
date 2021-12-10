const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function getUserPrefs(req, res) {
  
  const queryString = `SELECT preferences.pref_id, preferences.preference_name FROM preferences_relation
                       JOIN preferences ON preferences.pref_id=preferences_relation.pref_id
                       WHERE preferences_relation.c_id=${req.query.uid};`

  db.query(queryString, (error, rows) => {
    if (!error && rows.length) {
      res.json(rows)
    } else res.status(404)
  })
}

module.exports = getUserPrefs
