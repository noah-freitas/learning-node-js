fs = require 'fs'
async = require 'async'

try
  async.parallel
    data1: (callback) -> fs.readFile './data/data1.txt', 'utf8', (err, data) -> callback err, data
    data2: (callback) -> fs.readFile './data/data2.txt', 'utf8', (err, data) -> callback err, data
    data3: (callback) -> fs.readFile './data/data3.txt', 'utf8', (err, data) -> callback err, data
  , (err, result) ->
    throw err if err
    console.log result
catch err
  console.log err
