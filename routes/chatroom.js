var express = require('express');
var router = express.Router();
var connection = require('../conn');

// Find and chatroom
router.get('/:chatFrom', function(req, res, next) {
  var query = "SELECT * FROM chat_room r " +
              "RIGHT JOIN message m ON r.chat_no = m.chat_no " +
              "WHERE r.chat_from = '" + req.params.chatFrom + "' " +
              "OR r.chat_to = '" + req.params.chatFrom + "' " +
              "ORDER BY m.upd_datetime";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// Find and create chat room
router.get('/:chatFrom/:chatTo', function(req, res, next) {
  var params1 = req.params.chatFrom+"_"+req.params.chatTo;
  var params2 = req.params.chatTo+"_"+req.params.chatFrom;

  var query = "SELECT * FROM chat_room r " +
              "RIGHT JOIN message m ON r.chat_no = m.chat_no " +
              "WHERE r.chat_name = '" + params1 + "' " +
              "OR r.chat_name = '" + params2 + "' ";

  connection.query(query, function (err, result, fields) {
    if (err) throw err;

    // rows count
    if(result.length == 0){
      connection.query("INSERT INTO chat_room (chat_name, chat_from, chat_to) VALUES ('" + params1 + "', '" + req.params.chatFrom + "','" + req.params.chatTo + "');", function(err, result) {
        if(err) throw err;
        console.log("Insert chat_room completed");

        connection.query("INSERT INTO message (chat_no) VALUES ('" + result.insertId + "');", function(err, result) {
          if(err) throw err;
          console.log("Insert message completed");

          connection.query(query, function (err, result, fields) {
            if (err) throw err;
            res.json(result);
          });
        });
      });
    } else {
      res.json(result);
    }

  });
});

router.post('/msg', function (req, res) {
  var query = "UPDATE message SET " +
              "message_data = '" + JSON.stringify(req.body.message_data) + "', " +
              "upd_datetime = NOW(), " +
              "message_recent = '" + req.body.message_recent + "' " +
              "WHERE message_no = '" + req.body.message_no + "' " +
              "AND chat_no = '" + req.body.chat_no + "' ";

  connection.query(query, function(err, result) {
    if (err) throw err;
    res.json(result);
  });
})

// Find and chatroom
router.get('/msg/:chatNo/:msgNo', function(req, res, next) {
  connection.query("SELECT message_data FROM message WHERE chat_no = '"+req.params.chatNo+"' AND message_no = '"+req.params.msgNo+"'", function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

module.exports = router;
