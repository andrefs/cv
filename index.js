var http = require('http');
var fs = require('fs');
var index = fs.readFileSync('cv_andrefs.pdf');
var port = 9615;

console.log('Listening on http://localhost:'+port);
http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'application/pdf'});
        res.end(index);
    }
).listen(port);
