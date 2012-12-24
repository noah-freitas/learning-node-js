dgram = require 'dgram'

server = dgram.createSocket 'udp4'

server.on 'message', (msg, rinfo) ->
   console.log "Message: " + msg + " from " + rinfo.address + ":" + rinfo.port

server.bind 8124
