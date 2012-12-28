connect = require 'connect'
http = require 'http'

http.createServer(
  connect()
    .use(connect.favicon())
    .use(connect.logger())
    .use((req,res) -> res.end 'Hello World\n')
).listen 8124
