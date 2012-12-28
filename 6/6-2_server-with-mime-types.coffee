http = require 'http'
url  = require 'url'
fs   = require 'fs'
mime = require 'mime'
base = '/home/noah/workspaces/fun/learning-node-js/6'

http.createServer((req, res) ->

  pathname = base + req.url
  console.log pathname

  fs.stat pathname, (err, stats) ->
    if err
      res.writeHead 404
      res.write 'Bad request 404\n'
      res.end()
    else if stats.isFile()
      # content type
      type = mime.lookup pathname
      console.log type
      res.setHeader 'Content-Type', type
    
      # 200 status - found, no errors
      res.statusCode = 200

      # create and pipe readable stream
      file = fs.createReadStream pathname
      file.on 'open', -> file.pipe res
      file.on 'error', (err) -> console.log err
    else
      res.writeHead 403
      res.write 'Directory access is forbidden'
      res.end()
       
).listen 8124

console.log 'Server running at 8124/'
