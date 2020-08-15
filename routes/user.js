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

router.get('/doctor/:doctorId', function(req, res, next) {
  var query = "SELECT u.title old_title, u.firstname old_firstname, u.lastname old_lastname " +
              "FROM patient_record pr " +
              "INNER JOIN `user` u ON u.id = pr.user_id " +
              "WHERE pr.id = '" + req.params.doctorId + "' ";

  connection.query(query, function (err, result, fields) {
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
