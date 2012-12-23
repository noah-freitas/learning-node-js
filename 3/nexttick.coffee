# process.nextTick example
asynchFunction = (data, callback) ->
  process.nextTick () ->
    callback data

# setTimeout version
asynchFunction = (data, callback) ->
  setTimeout () ->
    callback data
  , 0
