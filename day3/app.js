const express = require('express');
const redis = require('redis');
const database = require('./database');


var app = express();
var client = redis.createClient(6379, 'my_redis_container', {
  retry_strategy: options => {
    return;
  },
});

app.get('/', (req, res) => {
  if (client.connected) {
    client.incr('page_load_count', (error, reply) => {
      var msg = 'Connected to redis, you are awesome :D' + 'Page loaded ' + reply + ' times!';
      res.statusCode = 200;
      res.send(msg);
      return;
    });
  } else {
    var msg = "Failed to connect to redis :'(";
    res.statusCode = 500;
    res.send(msg);
  }
});

// Should return an array of 10 item names.
app.get('/items', (req, res) => {
  database.get();
});

// Should add an item to the database.
app.post('/items/:name', (req, res) => {
  var name = req.params.name;
  var date = Math.floor(Date.now() /1000); 
  database.insert(name, date);
});

app.listen(3000);