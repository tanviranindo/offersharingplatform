const { getDatabaseConnection } = require('../db');

const db = getDatabaseConnection()

function createPost(req, res) {
    const queryString = `INSERT INTO posts (create_date, event_date, restaurant_name, offer_name, price, person, c_uid, location) 
      VALUES (DATE("${new Date().toISOString().substr(0, 10)}"), DATE("${req.body.eventDate}"), '${req.body.restaurantName}', '${req.body.offerTitle}', '${req.body.price}', '${req.body.persons}', '${req.body.u_id}', '${req.body.location_id}');`
    db.query(queryString, (error) => {
        if (!error) {
            res.status(200)
            res.end()
        } else {
            res.status(404)
            res.end()
        }
    })
}

module.exports = createPost
