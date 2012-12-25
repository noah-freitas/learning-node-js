inputChecker = require('inputchecker').inputChecker

# testing new object and event handling
ic = new inputChecker 'Shelley', 'output'

ic.on 'write', (data) -> @writeStream.write data, 'utf8'
ic.on 'echo', (data) -> console.log @name + ' wrote ' + data
ic.on 'end', -> process.exit()

process.stdin.resume()
process.stdin.setEncoding 'utf8'
process.stdin.on 'data', (input) -> ic.check input