var express = require('express');
var router = express.Router();
var connection = require('../conn');

router.get('/', function(req, res, next) {
  res.sendFile('/index.html', { root: 'public' });
});

module.exports = router;
