connect = require 'connect'
http = require 'http'

app = connect()
app.use connect.logger 'dev'
app.use connect.cookieParser()
app.use (req, res, next) ->
  console.log "tracking #{req.cookies.username}"
  next()
app.use connect.static __dirname

http.createServer(app).listen 8124

console.log 'Server listening on port 8124'
