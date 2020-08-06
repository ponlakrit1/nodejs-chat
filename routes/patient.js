var express = require('express');
var router = express.Router();
var connection = require('../conn');

// Get record
router.get('/record/:pid', function(req, res, next) {
    var query = "SELECT d.name, p.s_text, p.o_text, p.a_text, p.p_text, p.cost, p.note, p.evaluate_score, p.evaluate_note, p.date FROM patient_record p " +
                "INNER JOIN disease d ON d.id = p.disease_id " +
                "WHERE p.patient_id = '" + req.params.pid + "' " +
                "ORDER BY p.date DESC";
  
    connection.query(query, function (err, result, fields) {
      if (err) throw err;
      res.json(result);
    });
});

// Get therapy
router.get('/therapy/:pid', function(req, res, next) {
    var query = "SELECT tp.frequency, tp.intensity, tp.time, tp.type, t.name, t.link, t.detail, t.frequency as frequency_default FROM therapy_to_patient tp " +
                "INNER JOIN patient_record p ON p.id = tp.record_id " +
                "INNER JOIN therapy t ON t.id = tp.therapy_id " +
                "WHERE p.patient_id = '" + req.params.pid + "' " +
                "ORDER BY p.date DESC";
  
    connection.query(query, function (err, result, fields) {
      if (err) throw err;
      res.json(result);
    });
});

// Get schedule
router.get('/schedule/:recordId', function(req, res, next) {
  var query = "SELECT * FROM schedule " +
              "WHERE record_id = '" + req.params.recordId + "' ";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

module.exports = router;