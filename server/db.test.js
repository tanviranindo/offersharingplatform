const { initializeSingleDatabase, getDatabaseConnection } = require('./db')

initializeSingleDatabase()
const db = getDatabaseConnection()

const queryString1 = `INSERT INTO users (name, type, joining_date, gender, date_of_birth, username, password ) VALUES ("Tahmid Farhad", 2, "2021-05-03", "Male", "1999-04-09", "tahmid1122", "121234")`

const queryString2 = `INSERT INTO customers (uid, picture, location, rating) VALUES (LAST_INSERT_ID(), "null", 1, 5) COMMIT`

const query = `SELECT * FROM locations`

db.query(query, (error, rows) => {
  if (error) throw error
  if (rows.length) console.log(rows)
  db.close()
})

// try {
//   db.beginTransaction(err => {
//     if (err) throw log();
//     db.query(queryString1, err => {
//       if (err) throw log()
//       db.query(queryString2, err => {
//         if (err) {
//           db.rollback(err => {
//             if (err) throw log()
//           })
//           throw log()
//         }
//         db.commit(err => {
//           if (err) throw log()
//         })
//         db.close()
//         console.log("SUCCESS")
//       })
//     })
//   }) 
// } catch (error) {
//   console.log("++++++ERROR++++++++++");
// }

// function log() {
//   return "ERROR"
// }