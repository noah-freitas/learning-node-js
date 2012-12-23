net = require 'net'

server = net.createServer (conn) ->
  console.log 'connected'

  conn.on 'data', (data) ->
    console.log data + ' from ' + conn.remoteAddress + ' ' + conn.remotePort
    conn.write 'Repeating: ' + data

  conn.on 'close', () -> console.log 'client closed connection'
.listen 8124

console.log 'listening on port 8124'