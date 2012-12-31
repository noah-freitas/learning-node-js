widgets = [
  id: 1
  name: 'The Great Widget'
  price: 1000.00
]

# index listing of widgets at /widgets/
exports.index = (req, res) -> res.send widgets

# display new widget form
exports.new = (req, res) -> res.send 'displaying new widget form'

# add a widget
exports.create = (req, res) ->
  indx = widgets.length + 1
  widgets[widgets.length] =
    id: indx
    name: req.body.widgetname
    price: parseFloat req.body.widgetprice
  console.log widgets[indx - 1]
  res.send "Widget #{req.body.widgetname} added with id #{indx}"

# show a widget
exports.show = (req, res) ->
  indx = parseInt(req.params.id) - 1
  if not widgets[indx]
    res.send "There is no widget with id of #{req.params.id}"
  else
    res.send widgets[indx]

# delete a widget
exports.destroy = (req, res) ->
  indx = req.params.id - 1
  delete widgets[indx]

  console.log "deleted #{req.params.id}"
  res.send "deleted #{req.params.id}"

# display edit form
exports.edit = (req, res) -> res.send 'displaying edit form'

# update a widget
exports.update = (req, res) ->
  indx = parseInt(req.params.id) - 1
  widgets[indx] =
    id: indx
    name: req.body.widgetname
    price: parseFloat req.body.widgetprice
  console.log widgets[indx]
  res.send "Updated #{req.params.id}"
