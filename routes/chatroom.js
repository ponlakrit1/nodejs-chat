var express = require('express');
var router = express.Router();
var connection = require('../conn');
// const { v4: uuidv4 } = require('uuid');

// Find chat room MED
router.get('/med/:chatId', function(req, res, next) {
  var query = "SELECT * FROM chat_room r " +
              "WHERE r.user_id = '" + req.params.chatId + "' " +
              "AND r.active_flag = 'Y' " +
              "ORDER BY r.update_date DESC";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// Find chat room PATIENT
router.get('/patient/:chatId', function(req, res, next) {
  var query = "SELECT * FROM chat_room r " +
              "WHERE r.patient_id = '" + req.params.chatId + "' " +
              "AND r.active_flag = 'Y' " +
              "ORDER BY r.update_date DESC";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// Find chat name MED
router.get('/msg/:chatName', function(req, res, next) {
  connection.query("SELECT message_data FROM chat_room WHERE chat_name = '"+req.params.chatName+"'", function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// Find chat name PATIENT
router.get('/msg/patient/:chatName', function(req, res, next) {
  connection.query("SELECT * FROM chat_room WHERE patient_id = '"+req.params.chatName+"' AND active_flag = 'Y'", function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// Send
router.post('/msg', function (req, res) {
  var query = "UPDATE chat_room SET " +
              "message_data = '" + JSON.stringify(req.body.message_data) + "', " +
              "update_date = NOW(), " +
              "recent_message = '" + req.body.message_recent + "' " +
              "WHERE chat_name = '" + req.body.chat_name + "' ";

  connection.query(query, function(err, result) {
    if (err) throw err;
    res.json(result);
  });
});

// Get chat room join last patient record
router.get('/patient-last/:userId', function(req, res, next) {
  var query = "SELECT c.chat_no, c.chat_name, c.patient_id_display, p.HN, p.phone, pr.date record_date, d.name as disease_name FROM chat_room c " +
              "INNER JOIN patient p ON p.id = c.patient_id " +
              "INNER JOIN patient_record pr ON pr.id = p.last_record_id " +
              "INNER JOIN disease d ON d.id = pr.disease_id " +
              "WHERE c.user_id = '" + req.params.userId + "' " +
              "AND c.active_flag = 'Y' " +
              "ORDER BY c.update_date DESC";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// Get record
router.get('/patient-last/:uid/:pid', function(req, res, next) {
  var query = "SELECT * FROM patient_record p " +
              "WHERE p.user_id = '" + req.params.uid + "' " +
              "AND p.patient_id = '" + req.params.pid + "' " +
              "ORDER BY p.date DESC";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});


module.exports = router;
