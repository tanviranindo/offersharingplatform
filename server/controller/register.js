const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function register(req, res) {

  let error = false;

  if (
    req.body.name &&
    req.body.username &&
    req.body.password &&
    req.body.joining_date &&
    req.body.dob &&
    req.body.gender &&
    req.body.location &&
    req.body.tos
  ) {

    const addUser = `INSERT INTO users (name, type, joining_date, gender, date_of_birth, username, password) VALUES ("${req.body.name}", 2, "${req.body.joining_date}", "${req.body.gender}", "${req.body.dob}", "${req.body.username}", "${req.body.password}")`

    const addCustomer = `INSERT INTO customers (uid, picture, location, rating) VALUES (LAST_INSERT_ID(), "https://www.pngarts.com/files/11/Avatar-PNG-Picture.png", ${req.body.location}, 5)`

    db.beginTransaction(err => {
      if (err) return error = true
      else {
        db.query(addUser, err => {
          if (err) return error = true
          else {
            db.query(addCustomer, err => {
              if (err) {
                db.rollback(err => {
                  if (err) return error = true
                })
                return error = true
              } else {
                db.commit(err => {
                  if (err) return error = true
                })
                res.json({ success : !error })
              }
            })
          }
        })
      }
    })
  }
}

module.exports = register