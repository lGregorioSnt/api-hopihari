const express = require('express');
const router = express.Router();

router.post('/login', (req, res) => {console.log('login route')});


module.exports = router;
