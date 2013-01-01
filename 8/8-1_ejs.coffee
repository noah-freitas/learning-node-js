http = require 'http'
ejs = require 'ejs'

# create http server
http.createServer((req, res) ->
  res.writeHead 200, 'content-type': 'text/html'

  # data to render
  names = ['Joe', 'Mary', 'Sue', 'Mark']
  title = 'Testing EJS'

  # render or error
  ejs.renderFile "#{__dirname}/views/test.ejs", {title: 'testing', names: names}, (err, result) ->
    if not err
      res.end result
    else
      res.end 'An error occurred accessing page'
      console.log err
).listen 8124

console.log 'Server running on 8124/'