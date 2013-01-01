###
  GET home page.
###

exports.index = (req, res) -> res.render 'index', title: 'Express', (err, stuff) ->
  if not err
    console.log stuff
    res.write stuff
    res.end()
