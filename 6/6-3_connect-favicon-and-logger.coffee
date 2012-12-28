connect = require 'connect'
http = require 'http'

app = connect()
  .use(connect.favicon())
  .use(connect.logger())
  .use((req, res) -> res.end 'Hello World\n')

http.createServer(app).listen 8124
