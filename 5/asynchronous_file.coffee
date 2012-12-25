fs = require 'fs'

try
  fs.readFile './apples2.txt', 'utf8', (err, data) ->
    throw err if err?

    adjData = data.replace /[A|a]pple/g, 'orange'

    fs.writeFile './oranges.txt', adjData, (err) -> throw err if err?
catch err
  console.error err
