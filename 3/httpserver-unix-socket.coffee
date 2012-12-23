# create server
# and callback function
http = require 'http'
fs = require 'fs'

http.createServer (req, res) ->

  query = require('url').parse(req.url).query
  console.log query
  file = require('querystring').parse(query).file

  # content header
  res.writeHead 200, 'Content-Type': 'text/plain'

  # increment global, write to client
  (res.write num for num in [0..99])

  # open and read in file contents
  data = fs.readFileSync file, 'utf8'
  res.write data
  res.end()
.listen '/tmp/node-server-sock'
