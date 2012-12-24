dgram = require 'dgram'

client = dgram.createSocket 'udp4'

# prepare for input from terminal
process.stdin.resume()

process.stdin.on 'data', (data) ->
  console.log data.toString 'utf8'
  client.send data, 0, data.length, 8124, "examples.burningbird.net", (err, bytes) ->
    if err then console.log 'error: ' + err else console.log 'successful'
