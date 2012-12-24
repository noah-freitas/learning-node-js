# load http module
http = require 'http'
fs = require 'fs'

# create http server
http.createServer((req, res) ->

  # open and read in server.js
  fs.readFile 'server.js', 'utf8', (err, data) ->

    res.writeHead 200, 'Content-Type': 'text/plain'
    if err
      res.write 'Could not find or open file for reading\n'
      
    else
      # if no error, write JS file to client
      res.write data

    res.end()

# listen on the Cloud 9 port.
).listen process.env.PORT, () -> console.log 'bound to port ' + process.env.PORT

console.log 'Server running on ' + process.env.PORT
