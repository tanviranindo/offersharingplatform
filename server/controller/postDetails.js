const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function postDetails(req, res) {
  
  const getPost = `SELECT * FROM posts WHERE pid=${req.query.pid};`
  // const getInterested = `SELECT i_uid, users.name FROM posts JOIN (interested_users, users) ON (posts.pid=interested_users.post_id AND interested_users.i_uid=users.uid) WHERE pid=${req.query.pid};`

  let details = {
    post: null,
    interested: null
  };

  db.query(getPost, (error, rows) => {
    if (!error && rows.length) {
      details.post = rows[0]
      // db.query(getInterested, (err, rows) => {
      //   details.interested = rows
      //   res.json(details)
      // })
    } else res.status(404)
  })
}

module.exports = postDetails
