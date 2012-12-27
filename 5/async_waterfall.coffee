fs = require 'fs'
async = require 'async'

try
  async.waterfall [
    (callback) ->
      fs.readFile './data/data1.txt', 'utf8', (err, data) -> callback err, data
    (text, callback) ->
      adjdata = text.replace /somecompany\.com/g, 'burningbird.net'
      callback null, adjdata
    (text, callback) ->
      fs.writeFile './data/data1.txt', text, (err) -> callback err, text
  ], (err, result) ->
    throw err if err
    console.log result
catch err
  console.log err
