var express = require('express');
var router = express.Router();
var connection = require('../conn');

router.get('/med/:userId', function(req, res, next) {
  connection.query("SELECT * FROM `user` WHERE email = '"+req.params.userId+"'", function (err, result, fields) {
    if (err) throw err;
      res.json(result);
  });
});

router.get('/patient/:userId', function(req, res, next) {
  connection.query("SELECT * FROM `patient` WHERE HN = '"+req.params.userId+"'", function (err, result, fields) {
    if (err) throw err;
      res.json(result);
  });
});

router.get('/', function(req, res, next) {
  connection.query("SELECT * FROM `user` ", function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

module.exports = router;
