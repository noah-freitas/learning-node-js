fs = require 'fs'

try
  data = fs.readFileSync './apples.txt', 'utf8'
  console.log data
  adjData = data.replace /[A|a]pple/g, 'orange'

  fs.writeFileSync './oranges.txt', adjData
catch err
  console.error err
