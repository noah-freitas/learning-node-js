globalValue = null

exports.setGlobal = (val) ->
  globalValue = val

exports.returnGlobal = () ->
  console.log global
  globalValue