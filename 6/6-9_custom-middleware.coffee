fs = require 'fs'

module.exports = customHandler = (path, missingmsg, directorymsg) ->
  if arguments.length < 3 then throw new Error 'missing parameter in customHandler'

  customHandler = (req, res, next) ->
    pathname = path + req.url
    console.log pathname
    fs.stat pathname, (err, stats) ->
      if err
        res.writeHead 404
        res.write missingmsg
        res.end()
      else if not stats.isFile()
        res.writeHead 403
        res.write directorymsg
        res.end()
      else
        next()
