const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function viewPost(req, res) {
    const queryString = `SELECT * FROM posts JOIN users ON posts.c_uid = users.uid 
    WHERE location = ${req.query.location} AND DATE(event_date) >= DATE("${req.query.event_date}") ORDER BY DATE(event_date) ASC`
    db.query(queryString, (error, rows) => {
        if (!error && rows.length) {
            res.json(rows)
        } else res.status(404)
    })
}

module.exports = viewPost