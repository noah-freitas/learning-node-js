express = require 'express'
http = require 'http'

app = express()

app.configure ->

app.get /^\/node?(?:\/(\d+)(?:\.\.(\d+))?)?/, (req, res) ->
  console.log req.params
  res.send req.params

app.get '/content/*', (req,res) -> res.send req.params

app.get '/products/:id/:operation?', (req,res) ->
  console.log req
  res.send "#{req.params.operation} #{req.params.id}"

http.createServer(app).listen 3000

console.log "Express server listening on port 3000"
