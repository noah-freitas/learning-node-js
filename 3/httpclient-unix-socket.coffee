http = require 'http'

options =
  method: 'GET'
  socketPath: '/tmp/node-server-sock'
  path: '/?file=main.txt'

req = http.request options, (res) ->
  console.log 'STATUS: ' + res.statusCode
  console.log 'HEADERS: ' + JSON.stringify res.headers
  res.setEncoding 'utf8'
  res.on 'data', (chunk) -> console.log 'chunk o\' data: ' + chunk

req.on 'error', (e) -> console.log 'problem with request: ' + e.message

# write data to request body
req.write 'data\n'
req.write 'data\n'
req.end()