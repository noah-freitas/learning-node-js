express = require 'express'
http = require 'http'
app = express()

app.configure ->
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.static "#{__dirname}/public"
  app.use express.bodyParser()
  app.use app.router

app.configure 'development', -> app.use express.errorHandler()

# in memory data store
widgets = [
  id: 1
  name: 'My Special Widget'
  price: 100.00
  descr: 'A widget beyond price'
]

# add widget
app.post '/widgets/add', (req, res) ->
  indx = widgets.length + 1
  widgets[widgets.length] =
    id: indx
    name: req.body.widgetname
    price: parseFloat req.body.widgetprice
    descr: req.body.widgetdesc
  console.log "added #{widgets[indx-1]}"
  res.send "Widget #{req.body.widgetname} added with id #{indx}"

# show widget
app.get '/widgets/:id', (req, res) ->
  indx = parseInt(req.params.id) - 1
  if not widgets[indx]
    res.send "There is no widget with id of #{req.params.id}"
  else
    res.send widgets[indx]

http.createServer(app).listen 3000

console.log 'Express server listening on port 3000'
