var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
});

// app.get('/fun', function (req, res) {
//     let func = `function(){\n
//         return "Hello Worlds"\n
//     }\n`;

//     func = func + "\n Hello World!"
//     res.send(func);
//   });

app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});