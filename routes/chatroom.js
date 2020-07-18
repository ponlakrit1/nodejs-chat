var express = require('express');
var router = express.Router();
var connection = require('../conn');
const { v4: uuidv4 } = require('uuid');

// Find and chatroom
router.get('/:chatFrom', function(req, res, next) {
  var query = "SELECT * FROM chat_room r " +
              "RIGHT JOIN chat_message m ON r.chat_no = m.chat_no " +
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
  var query = "SELECT * FROM `user` " +
              "WHERE email = '" + req.params.chatFrom + "' " +
              "OR email = '" + req.params.chatTo + "' ";

  var userM;
  var userA;

  connection.query(query, function (err, result, fields) {
    if (err) throw err;
    if(result.length == 2){
      // get user id for A and M
      if(result[0].role == "M"){
        userM = result[0];
        userA = result[1];
      } else {
        userA = result[0];
        userM = result[1];
      }

      var query = "SELECT * FROM chat_room r " +
                  "RIGHT JOIN chat_message m ON r.chat_no = m.chat_no " +
                  "WHERE r.chat_from = '" + userM.id + "' " +
                  "OR r.chat_to = '" + userA.id + "' ";
      connection.query(query, function (err, result, fields) {
        if (err) throw err;
        if(result.length == 0){
          connection.query("INSERT INTO chat_room (chat_name, chat_from, chat_from_display, chat_to, chat_to_display) VALUES ('" + uuidv4() + "', '" + userM.id + "', '" + (userM.title+" "+userM.firstname+" "+userM.lastname) + "', '" + userA.id + "', '" + (userA.title+" "+userA.firstname+" "+userA.lastname) + "');", function(err, result) {
            if(err) throw err;
            // console.log("Insert chat_room completed");
            connection.query("INSERT INTO chat_message (chat_no) VALUES ('" + result.insertId + "');", function(err, result) {
              if(err) throw err;
              // console.log("Insert chat_message completed");
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
    }
  });

});

router.post('/msg', function (req, res) {
  var query = "UPDATE chat_message SET " +
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
  connection.query("SELECT message_data FROM chat_message WHERE chat_no = '"+req.params.chatNo+"' AND message_no = '"+req.params.msgNo+"'", function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

module.exports = router;
