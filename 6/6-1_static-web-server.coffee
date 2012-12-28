http = require 'http'
fs   = require 'fs'
base = '/home/noah/workspaces/fun/learning-node-js/6'

http.createServer((req, res) ->

  pathname = base + req.url
  console.log pathname

  fs.exists pathname, (exists) ->
    if not exists
      res.writeHead 404
      res.write 'Bad request 404\n'
      res.end()
    else
      res.setHeader 'Content-Type', 'text/html'
  
      # 200 status - found, no errors
      res.statusCode = 200

      # create and pipe readable stream
      file = fs.createReadStream pathname
      file.on 'open', -> file.pipe res
      file.on 'error', (err) -> console.log err

).listen 8124

console.log 'Server running at 8124/'
