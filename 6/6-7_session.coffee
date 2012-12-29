connect = require 'connect'
http = require 'http'

# clear all session data
clearSession = (req, res, next) ->
  if req.url is '/clear'
    req.session = null
    res.statusCode = 302
    res.setHeader 'Location', '/'
    res.end()
  else
    next()

# track user
trackUser = (req, res, next) ->
  req.session.ct = req.session.ct ? 0
  req.session.username = req.session.username ? req.cookies.username
  req.session.ct += 1
  console.log "#{req.cookies.username} requested #{req.session.ct} resources this session"
  next()

# cookie and session
app = connect()
app.use connect.logger 'dev'
app.use connect.cookieParser 'mumble'
app.use connect.cookieSession key: 'tracking'
app.use clearSession
app.use trackUser

# static server
app.use connect.static __dirname
# start server and listen
http.createServer(app).listen 8124
console.log 'Server listening on port 8124'
