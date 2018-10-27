const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

/**
 * GET route template
 */
router.get('/', (req, res) => {
    console.log('get works');
});

/**
 * POST route template
 */
router.post('/', (req, res) => {
    console.log('post works');
    
});

module.exports = router;