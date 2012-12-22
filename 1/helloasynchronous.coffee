# load http module
http = require 'http'
fs = require 'fs'

# create http server
http.createServer((req, res) ->

  # open and read in server.js
  fs.readFile 'server.js', 'utf8', (err, data) ->

    res.writeHead 200, 'Content-Type': 'text/plain'

    # if there's an error print an message
    # otherwise write JS file to client
    if err
      res.write 'Could not find or open file for reading\n'
    else
      res.write data

    # Close the response.
    res.end()

# listen on the Cloud 9 port.
).listen process.env.PORT, () -> console.log 'bound to port ' + process.env.PORT

console.log 'Server running on ' + process.env.PORT
