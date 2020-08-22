var express = require('express');
var router = express.Router();
var connection = require('../conn');
const mysql = require('mysql');

// ค้นหาห้องแชททั้งหมดทั้งแพทย์คนนั้นๆสามารถคุยได้จาก user_id
router.get('/med/:chatId', function(req, res, next) {
  var query = "SELECT * FROM chat_room r " +
              "WHERE r.user_id = '" + req.params.chatId + "' " +
              "AND r.active_flag = 1 " +
              "ORDER BY r.update_date DESC";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// ค้นหาห้องแชทสำหรับผู้ป่วยจาก patient_id [ตัวเก่า]
router.get('/patient/:chatId', function(req, res, next) {
  var query = "SELECT * FROM chat_room r " +
              "WHERE r.patient_id = '" + req.params.chatId + "' " +
              "AND r.active_flag = 1 " +
              "ORDER BY r.update_date DESC";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// ค้นหาข้อความของห้องแชทนั้นๆจาก chat_name
router.get('/msg/:chatName', function(req, res, next) {
  connection.query("SELECT message_data FROM chat_room WHERE chat_name = '"+req.params.chatName+"'", function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// ค้นหาห้องแชทสำหรับผู้ป่วยจาก patient_id [ตัวใหม่]
router.get('/msg/patient/:chatName', function(req, res, next) {
  connection.query("SELECT * FROM chat_room WHERE patient_id = '"+req.params.chatName+"' AND active_flag = 1 ", function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// บันทึกข้อความหลังจากส่งข้อความผ่าน socket
router.post('/msg', function (req, res) {
  let query = "UPDATE ?? SET " +
              "?? = ?, " +
              "?? = NOW(), " +
              "?? = ? " +
              "WHERE ?? = ? ";
  let options = mysql.format(query, ["chat_room", "message_data", JSON.stringify(req.body.message_data), "update_date", "recent_message", req.body.message_recent, "chat_name", req.body.chat_name]);

  connection.query(options, function(err, result) {
    if (err) throw err;
    res.json(result);
  });
});

// ค้นหารายละเอียดการรักษาของผู้ป่วยเพื่อแสดงในห้องแชท [แพทย์]
router.get('/patient-last/:userId', function(req, res, next) {
  var query = "SELECT c.chat_no, c.chat_name, c.patient_id_display, p.HN, p.phone, pr.date record_date, d.name as disease_name FROM chat_room c " +
              "INNER JOIN patient p ON p.id = c.patient_id " +
              "INNER JOIN patient_record pr ON pr.id = p.last_record_id " +
              "INNER JOIN disease d ON d.id = pr.disease_id " +
              "WHERE c.user_id = '" + req.params.userId + "' " +
              "AND c.active_flag = 1 " +
              "ORDER BY c.update_date DESC";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// ค้นหารายละเอียดการรักษา [ประวัติการรักษาแต่ละครั้ง]
router.get('/patient-last/:uid/:pid', function(req, res, next) {
  var query = "SELECT d.name, p.s_text, p.o_text, p.a_text, p.p_text, p.cost, p.note, p.evaluate_score, p.evaluate_note, p.date FROM patient_record p " +
              "INNER JOIN disease d ON d.id = p.disease_id " +
              "WHERE p.user_id = '" + req.params.uid + "' " +
              "AND p.patient_id = '" + req.params.pid + "' " +
              "ORDER BY p.date DESC";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// ค้นหาข้อมูลแพทย์ หากมีการเปลี่ยนแพทย์ที่รักษา
router.get('/history/:pid', function(req, res, next) {
  let query = "SELECT u1.title old_title, u1.firstname old_firstname, u1.lastname old_lastname, u2.title, u2.firstname, u2.lastname FROM chat_doctor_history c " +
              "INNER JOIN `user` u1 ON u1.id = c.old_user_id " +
              "INNER JOIN `user` u2 ON u2.id = c.new_user_id	 " +
              "WHERE c.patient_id = '" + req.params.pid + "' " +
              "AND c.	active_flag = 1 ";

  let updateQuery = "UPDATE chat_doctor_history SET " +
                    "active_flag = 0 " +
                    "WHERE patient_id = " + req.params.pid;

  //select
  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });

  //update
  connection.query(updateQuery, function(err, result) {
    if (err) throw err;
  });
});

module.exports = router;
