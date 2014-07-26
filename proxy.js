var httpProxy = require('http-proxy');

var proxy = httpProxy.createProxyServer({target: 'http://localhost:9000'}).listen(88)
