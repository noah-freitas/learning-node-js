connect = require 'connect'
http = require 'http'
fs = require 'fs'
custom = require './6-9_custom-middleware'
base = __dirname

http.createServer(
  connect()
    .use(connect.favicon "#{base}/favicon.ico")
    .use(connect.logger())
    .use(custom base, '404 File Not Found', '403 Directory Access Forbidden')
    .use(connect.static base)
).listen 8124
