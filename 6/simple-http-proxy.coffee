http = require 'http'
httpProxy = require 'http-proxy'

httpProxy.createServer(8124, 'localhost').listen 8000

http.createServer((req, res) ->
  res.writeHead 200, 'Content-Type': 'text/plain'
  res.write "request successfully proxied!\n#{JSON.stringify req.headers, true, 2}"
  res.end()
).listen 8124
