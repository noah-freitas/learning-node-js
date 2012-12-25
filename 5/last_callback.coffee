obj = ->

obj::doSomething = (arg1, arg2_) ->
  arg2 = if typeof arg2_ is 'string' then arg2_ else null

  callback_ = arguments[arguments.length - 1]
  callback = if typeof callback_  is 'function' then callback_ else null

  if not arg2?
    return callback new Error 'second argument missing or not a string'

  callback arg1

test = new obj

try
  test.doSomething 'test', 3.55, (err, value) ->
    throw err if err?
    console.log value
catch err
  console.error err
