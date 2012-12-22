# load http module
http = require "http"

# create http server
http.createServer((req, res) ->
  # content header
  res.writeHead 200, {'content-type': 'text/plain'}

  # write message and signal communication is complete
  res.end "Hello, World!\n"
).listen process.env.PORT

console.log 'Server running on ' + process.env.PORT