net = require 'net'
redis = require 'redis'

server = net.createServer (conn) ->
  console.log 'connected'

  # create Redis client
  client = redis.createClient()

  client.on 'error', (err) -> console.log "Error #{err}"

  # sixth database is image queue
  client.select 6
  # listen for incoming data
  conn.on 'data', (data) ->
    console.log "#{data} from #{conn.remoteAddress} #{conn.remotePort}"

    # store data
    client.rpush 'images', data

server.listen 3000

server.on 'close', (err) -> client.quit()

console.log 'listening on port 3000'
