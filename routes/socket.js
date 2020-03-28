var express = require('express');
var router = express.Router();
var connection = require('../conn');

/* GET home page. */
router.get('/', function(req, res, next) {
  // res.sendFile(__dirname + '/index.html');

  connection.query("SELECT * FROM user_system", function (err, result, fields) {
    if (err) throw err;
    res.send(result);
  });
});

module.exports = router;
