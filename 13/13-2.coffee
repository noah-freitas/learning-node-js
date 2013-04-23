counter = 0

app = require('http').createServer (req, res) ->
  require('fs').readFile "#{__dirname}/13-1.html", (err, data) ->
    if err
      res.writeHead 500
      res.end 'Error loading 13-1.html'
    counter = 1
    res.writeHead 200
    res.end data

io = require('socket.io').listen app
app.listen 9000

io.sockets.on 'connection', (socket) ->
  socket.emit 'news', news: 'world'
  socket.on 'echo', (data) ->
    if counter <= 50
      counter += 1
      data.back += counter
      socket.emit 'news', news: data.back

