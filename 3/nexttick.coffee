asynchFunction = (data, callback) ->
  process.nextTick () ->
    callback data
