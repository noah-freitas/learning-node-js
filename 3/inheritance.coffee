util = require 'util'

# define original object
class first
  constructor: ->
    @name = 'first'
    @test = => console.log @name
  
  output: -> console.log @name

# inherit from first
class second extends first
  constructor: ->
    super()
    @name = 'second'

# This is handled by coffeescript's extends
# util.inherits second, first

two = new second

class third
  constructor: (func) ->
    @name = 'third'
    @callMethod = func


three = new third two.test

# all three should output "second"
two.output()
two.test()
three.callMethod()
