net = require 'net'
redis = require 'redis'

server = net.createServer (conn) ->
  console.log 'connected'

  # create Redis client
  client = redis.createClient()

  client.on 'error', (err) -> console.log "Error #{err}"

  # fifth database is game score database
  client.select 5
  conn.on 'data', (data) ->
    console.log "#{data} from #{conn.remoteAddress} #{conn.remotePort}"
    try
      obj = JSON.parse data

      # add or overwrite score
      client.hset obj.member, 'first_name', obj.first_name, redis.print
      client.hset obj.member, 'last_name', obj.last_name, redis.print
      client.hset obj.member, 'score', obj.score, redis.print
      client.hset obj.member, 'date', obj.date, redis.print

      # add to scores for Zowie!
      client.zadd 'Zowie!', parseInt(obj.score), obj.member
    catch err
      console.log err

  conn.on 'close', ->
    console.log 'client closed connection'
    client.quit()

server.listen 8124

console.log 'listening on port 8124'
