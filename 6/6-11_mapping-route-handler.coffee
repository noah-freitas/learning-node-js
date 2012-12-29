crossroads = require 'crossroads'
http = require 'http'

typeRoute = crossroads.addRoute '/{type}/{id}'

onTypeAccess = (type, id) ->
  console.log "access #{type} #{id}"

typeRoute.matched.add onTypeAccess

http.createServer((req, res) ->
  crossroads.parse req.url
  res.end 'processing'
).listen 8124
