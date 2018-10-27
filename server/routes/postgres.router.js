var express = require('express');
var router = express.Router();
var pool = require('../modules/pool');

router.post('/', function(req, res) {
    
    pool.connect( function(err, client, done) {
        let name = req.body.name
        let description = req.body.description
        let whentotake = req.body.time
        let frequency = req.body.frequency
        let active = req.body.active
        let slot = req.body.slot
        if (err) {
            console.log('Pool Connection Error');
            done();
            res.sendStatus(500);
        } else {
            let query = "INSERT INTO prescription (name, description, whentotake, frequency, active, slot) VALUES ($1, $2, $3, $4, $5);";
            client.query(query, [name, description, whentotake, frequency, active, slot], function (quErr, resObj){
                done();
                if (quErr) {
                    console.log('query error', quErr);
                    res.sendStatus(500); 
                } else {
                    res.sendStatus(200);
                }
            });//END client.query
        }
    })//END pool connect
});

module.exports = router;