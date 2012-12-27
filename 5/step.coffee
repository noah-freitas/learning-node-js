fs = require 'fs'
Step = require 'step'

try
  Step(
    () ->
      fs.readFile './data/data1.txt', 'utf8', @
    , (err, text) ->
      throw err if err
      text.replace /somecompany\.com/g, 'burningbird.net'
    , (err, text) ->
      throw err if err
      fs.writeFile './data/data1.txt', text, @
  )
catch err
  console.error err
