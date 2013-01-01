widgets = [
  id: 1
  name: 'The Great Widget'
  price: 1000.00
]

# index listing of widgets at /widgets/
exports.index = (req, res) -> res.render 'widgets/index', title: 'Widgets', widgets: widgets

# display new widget form
exports.new = (req, res) ->
  filePath = require('path').normalize "#{__dirname}/../public/widgets/new.html"
  res.sendfile filePath

# add a widget
exports.create = (req, res) ->
  # generate widget id
  indx = widgets.length + 1

  # add widget
  widgets[widgets.length] =
    id: indx
    name: req.body.widgetname
    price: parseFloat req.body.widgetprice
    desc: req.body.widgetdesc

  # print out to console and confirm addition to user
  console.log widgets[indx - 1]
  res.render 'widgets/added', title: 'Widget Added', widget: widgets[indx - 1]

# show a widget
exports.show = (req, res) ->
  indx = parseInt(req.params.id) - 1
  if not widgets[indx]
    res.send "There is no widget with id of #{req.params.id}"
  else
    res.render 'widgets/show', title: 'Show Widget', widget: widgets[indx]

# delete a widget
exports.destroy = (req, res) ->
  indx = req.params.id - 1
  delete widgets[indx]

  console.log "deleted #{req.params.id}"
  res.send "deleted #{req.params.id}"

# display edit form
exports.edit = (req, res) ->
  indx = parseInt(req.params.id) - 1
  res.render 'widgets/edit', title: 'Edit Widget', widget: widgets[indx]

# update a widget
exports.update = (req, res) ->
  indx = parseInt(req.params.id) - 1
  widgets[indx] =
    id: indx + 1
    name: req.body.widgetname
    price: parseFloat req.body.widgetprice
    desc: req.body.widgetdesc
  console.log widgets[indx]
  res.render 'widgets/added', title: 'Widget Edited', widget: widgets[indx]
