readline = require 'readline'

# create a new interface
interface = readline.createInterface process.stdin, process.stdout, null

# ask question
interface.question ">>What is the meaning of life?  ", (answer) ->
  console.log "About the meaning of life, you said " + answer
  interface.setPrompt ">>"
  interface.prompt()

# function to close interface
closeInterface = ->
  console.log 'Leaving interface...'
  process.exit()

# listen for .leave
interface.on 'line', (cmd) ->
  if cmd.trim() is '.leave'
    closeInterface()
    return
  else
    console.log "repeating command: " + cmd
  interface.setPrompt ">>"
  interface.prompt()

interface.on 'close', -> closeInterface()