redis = require 'redis'
http = require 'http'

messageServer = http.createServer()

# listen for incoming request
messageServer.on 'request', (req, res) ->

  # first filter out icon request
  if req.url is '/favicon.ico'
    res.writeHead 200, 'Content-Type': 'image/x-icon'
    res.end()
    return

  # create Redis client
  client = redis.createClient()

  client.on 'error', (err) -> console.log "Error #{err}"

  # set database to 6
  client.select 6

  client.lpop 'images', (err, reply) ->
    if err
      return console.error "error response #{err}"

    # if data
    if reply
      res.write "#{reply}\n"
    else
      res.write 'End of queue\n'
    res.end()

  client.quit()

messageServer.listen 8124

console.log 'listening on 8124'
