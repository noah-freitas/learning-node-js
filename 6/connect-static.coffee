connect = require 'connect'
http = require 'http'

http.createServer(
  connect()
    .use(connect.logger())
    .use(connect.static(__dirname), redirect: true)
).listen 8124
