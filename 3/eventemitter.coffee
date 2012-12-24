eventEmitter = require('events').EventEmitter
counter = 0

em = new eventEmitter

setInterval -> 
  em.emit 'timed', counter++
, 3000

em.on 'timed', (data) -> console.log 'timed ' + data
