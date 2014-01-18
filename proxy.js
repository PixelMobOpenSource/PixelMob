var http = require('http'),
    httpProxy = require('http-proxy');
//
// Create your proxy server
//
httpProxy.createServer(9000, 'localhost').listen(88);