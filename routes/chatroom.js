var express = require('express');
var router = express.Router();
var connection = require('../conn');

// Find and chatroom
router.get('/:chatFrom', function(req, res, next) {
  connection.query("SELECT * FROM chat_room WHERE chat_from = '"+req.params.chatFrom+"' OR chat_to = '"+req.params.chatFrom+"'", function (err, result, fields) {
    if (err) throw err;
    res.json(result);
  });
});

// Find and create chat room
router.get('/:chatFrom/:chatTo', function(req, res, next) {
  var params1 = req.params.chatFrom+"_"+req.params.chatTo;
  var params2 = req.params.chatTo+"_"+req.params.chatFrom;

  connection.query("SELECT * FROM chat_room WHERE chat_name = '"+params1+"' OR chat_name = '"+params2+"'", function (err, result, fields) {
    if (err) throw err;

    // rows count
    if(result.length == 0){
      connection.query("INSERT INTO chat_room (chat_name, chat_from, chat_to) VALUES ('" + params1 + "', '" + req.params.chatFrom + "','" + req.params.chatTo + "');", function(err, result) {
        if(err) throw err;
        console.log("Insert chat_room completed");

        connection.query("INSERT INTO message (chat_no) VALUES ('" + result.insertId + "');", function(err, result) {
          if(err) throw err;
          console.log("Insert message completed");
        });
      });

      connection.query("SELECT * FROM chat_room WHERE chat_name = '"+params1+"' OR chat_name = '"+params2+"'", function (err, result, fields) {
        if (err) throw err;
        res.json(result);
      });
    } else {
      res.json(result);
    }

  });
});

module.exports = router;
