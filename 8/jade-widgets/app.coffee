express = require 'express'
routes = require './routes'
map = require './maproute'
http = require 'http'
app = express()

app.configure ->
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.staticCache maxObjects: 100, maxLength: 512
  app.use express.static "#{__dirname}/public"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.directory "#{__dirname}/public"
  app.use (req, res, next) -> throw new Error "#{req.url} not found"
  app.use (err, req, res, next) ->
    console.log err
    res.send err.message

app.configure 'development', -> app.use express.errorHandler()

app.get '/', routes.index
prefixes = ['widgets']

# map route to controller
(map.mapRoute app, prefix for prefix in prefixes)

http.createServer(app).listen 3000

console.log 'Express server listening on port 3000'
