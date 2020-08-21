var express = require('express');
var router = express.Router();
var connection = require('../conn');

// ค้นหาแพทย์จาก table user ที่ status = 1 [login]
router.get('/med/:userId', function(req, res, next) {
  connection.query("SELECT * FROM `user` WHERE email = '"+req.params.userId+"' AND status = 1 ", function (err, result, fields) {
    if (err) throw err;
      res.json(result);
  });
});

// ค้นผู้ป่วยจาก table patient [login]
router.get('/patient/:userId', function(req, res, next) {
  connection.query("SELECT * FROM `patient` WHERE HN = '"+req.params.userId+"'", function (err, result, fields) {
    if (err) throw err;
      res.json(result);
  });
});

// ค้นหาแพทย์ที่ทำการรักษาในปัจจุบัน
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

// อันนี้ไม่ใช้
// router.get('/', function(req, res, next) {
//   connection.query("SELECT * FROM `user` ", function (err, result, fields) {
//     if (err) throw err;
//     res.json(result);
//   });
// });

module.exports = router;
