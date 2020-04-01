var express = require('express');
var router = express.Router();
var connection = require('../conn');

router.get('/:userId', function(req, res, next) {

  connection.query("SELECT * FROM user_system WHERE USERNAME = '"+req.params.userId+"'", function (err, result, fields) {
    if (err) throw err;

    // rows count
    if(result.length == 0){
      connection.query("INSERT INTO user_system (USERNAME, USER_ROLE) VALUES ('" + req.params.userId + "', 'P');", function(err, insertResult) {
        if(err) throw err;
        console.log("Insert completed");

        // select result
        connection.query("SELECT * FROM user_system WHERE USERNAME = '"+req.params.userId+"'", function (err, result, fields) {
          if(err) throw err;
          res.send(result);
        });
      });
    } else {
      res.send(result);
    }

  });
});

module.exports = router;
