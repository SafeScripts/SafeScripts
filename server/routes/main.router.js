const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();
const Particle = require('particle-api-js');
const particle = new Particle();
const token = "5f954d861ab114c44a2ac650e9c69ec1bfc6de3b";
const axios = require('axios');

router.get('/', (req, res) => {
    console.log('touchdown from device');
    
});

// Call a function on photon particle
router.post('/', (req, res) => {
    axios({
        method: 'POST',
        url:`https://api.particle.io/v1/devices/2e003a000e47363433353735/led01?access_token=5f954d861ab114c44a2ac650e9c69ec1bfc6de3b`,
        data: {arg: 'off'}
    });
    res.sendStatus(200);
});

module.exports = router;