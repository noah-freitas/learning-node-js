util = require 'util'
eventEmitter = require('events').EventEmitter
fs = require 'fs'

class inputChecker extends eventEmitter
  constructor: (@name, file) ->
    @writeStream = fs.createWriteStream './' + file + '.txt',
      flags: 'a'
      encoding: 'utf8'
      mode: 0666

  check: (input) ->
    command = input.toString().trim().substr 0, 3
    switch command
      when 'wr:' then @emit 'write', input.substr 3, input.length
      when 'en:' then @emit 'end'
      else @emit 'echo', input

# testing new object and event handling
ic = new inputChecker 'Shelley', 'output'

ic.on 'write', (data) -> @writeStream.write data, 'utf8'
ic.on 'echo', (data) -> console.log @name + ' wrote ' + data
ic.on 'end', -> process.exit()

process.stdin.resume()
process.stdin.setEncoding 'utf8'
process.stdin.on 'data', (input) -> ic.check input
