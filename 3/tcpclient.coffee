net = require 'net'

client = new net.Socket
client.setEncoding 'utf8'

# connect to server
client.connect '8124','localhost', () ->
  console.log 'connected to server'
  client.write 'Who needs a browser to communicate?'

# prepare for input from terminal
process.stdin.resume();

# when receive data, send to server
process.stdin.on 'data', (data) -> client.write data

# when receive data back, print to console
client.on 'data', (data) -> console.log data

# when server closed
client.on 'close', () -> console.log 'connection is closed'
