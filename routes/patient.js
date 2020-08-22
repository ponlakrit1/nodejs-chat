const express = require('express');
const moment = require('moment');
const router = express.Router();
const connection = require('../conn');

// ค้นหารายละเอียดการรักษาของ table patient_record จาก patient_id
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

// ค้นหาการทำกายภาพบำบัดของแต่ละ patient
router.get('/therapy/:pid', function(req, res, next) {
    var query = "SELECT tp.id, tp.frequency, tp.intensity, tp.time, tp.type, t.name, t.link, t.detail, t.frequency as frequency_default FROM therapy_to_patient tp " +
                "INNER JOIN patient_record p ON p.id = tp.record_id " +
                "INNER JOIN therapy t ON t.id = tp.therapy_id " +
                "WHERE p.patient_id = '" + req.params.pid + "' " +
                "ORDER BY p.date DESC";
  
    connection.query(query, function (err, result, fields) {
      if (err) throw err;
      res.json(result);
    });
});

// ค้นหาวันนัดครั้งต่อไปจาก last_record_id ของ table patient
router.get('/schedule/:recordId', function(req, res, next) {
  var query = "SELECT * FROM schedule " +
              "WHERE record_id = '" + req.params.recordId + "' ";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// Upload exercise assignment and joint data
router.post('/therapy/exercise', function (req, res) {
  const tp_id = req.body.tp_id;   //therapy_to_patient id
  const joint = req.body.joint;   //recorded patient's joints
  const currentTime = moment().format("YYYY-MM-DD HH:mm:ss");

  // console.log(tp_id + " " + joint + " " + currentTime);
  const query = "INSERT INTO therapy_exercise(tp_id, joint, time) VALUES(?, ?, ?)";

  connection.query(query, [tp_id, joint, currentTime], function (err, result) {
    if (err) {
      console.log(err.message);
      res.status(500).send("Internal server error");
    }

    // get inserted rows
    const numrows = result.affectedRows;
    if (numrows != 1) {
      res.status(405).send("Upload failed");
    }
    else {
      res.send("Upload Complete!");
    }
  });
});

// Query joint data of patient from therapy id
router.get("/joints/:id", function(req, res) {
  // therapy id
  const tp_id = req.params.id;
  const query = "SELECT joint, time FROM therapy_exercise WHERE tp_id = ?";
  connection.query(query, tp_id, function (err, result) {
      if (err) {
        console.error(err.message);
        res.status(500).send("Internal server error");
      }           
      res.json(result);
  });
});

module.exports = router;