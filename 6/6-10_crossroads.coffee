crossroads = require 'crossroads'
http = require 'http'

crossroads.addRoute '/category/{type}/:pub:/:id:', (type, pub, id) ->
  if not id and not pub
    console.log "Accessing all entries of category #{type}"
    return
  else if not id
    console.log "Accessing all entries of category #{type} and pub #{pub}"
    return
  else
    console.log "Accessing item #{id} of pub #{pub} of category #{type}"

http.createServer((req, res) ->
  crossroads.parse req.url
  res.end 'and that\'s all\n'
).listen 8124
