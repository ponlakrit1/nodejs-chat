var express = require('express');
var router = express.Router();
var connection = require('../conn');

router.get('/user/:userId', function(req, res, next) {
  // res.send(req.params.userId);

  connection.query("SELECT * FROM user_system WHERE USERNAME = '"+req.params.userId+"'", function (err, result, fields) {
    if (err) throw err;
    res.send(result);
  });
});

router.get('/', function(req, res, next) {
  res.sendFile('/index.html', { root: 'public' });
});

module.exports = router;
