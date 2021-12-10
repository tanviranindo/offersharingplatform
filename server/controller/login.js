const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function login(req, res) {
  if (req.body.username && req.body.password) {
    const queryString = `SELECT customers.location AS lid, users.uid, users.name, customers.picture, users.password, locations.name AS location,
                                customers.rating, users.joining_date, users.date_of_birth, users.gender
                         FROM users
                         JOIN (customers, locations) ON (users.uid=customers.uid AND locations.lid=customers.location)
                         WHERE username="${req.body.username}"`

    db.query(queryString, (error, rows) => {
      if ((!error && rows.length) && (req.body.password == rows[0].password)) {
        res.json({ isLoggedIn: true, user: rows[0] })
      } else res.json({ isLoggedIn: false })
    })
  } else res.json({ isLoggedIn: false })
}

module.exports = login
