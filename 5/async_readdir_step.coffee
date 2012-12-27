fs = require 'fs'
Step = require 'step'
files = null
_dir = './data/'

try
  Step(
    () -> 
      fs.readdir _dir, @
      undefined
    , (err, results) ->
      throw err if err
      files = results
      group = @group()
      (fs.readFile _dir + name, 'utf8', group() for name in results)
      undefined
    , (err, data) ->
      throw err if err
      for file, ii in files
        adjdata = data[ii].replace /somecompany\.com/g, 'burningbird.net'
        fs.writeFile _dir + file, adjdata, 'utf8', @
      undefined
  )
catch err
  console.log err
