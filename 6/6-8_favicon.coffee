module.exports = favicon = (path, options) ->
  options = options ? {}
  path = path ? "#{__dirname}/../public/favicon.ico"
  maxAge = options.maxAge ? 86400000

  favicon = (req, res, next) ->
    if req.url is '/favicon.ico'
      if icon
        res.writeHead 200, icon.headers
        res.end icon.body
      else
        fs.readFile path, (err, buf) ->
          next err if err
          icon =
            headers:
              'Content-Type': 'image/x-icon'
              'Content-Length': buf.length
              ETag: "\"#{utils.md5 buf}\""
              'Cache-Control': "public, max-age=#{maxAge / 1000}"
            body: buf
          res.writeHead 200, icon.headers
          res.end icon.body
    else
      next()
