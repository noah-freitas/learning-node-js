spawn = require('child_process').spawn
find = spawn 'find', ['.', '-ls']
grep = spawn 'grep', ['test']

grep.stdout.setEncoding 'utf8'

# direct results of find to grep
find.stdout.on 'data', (data) -> grep.stdin.write data

# now run grep and output results
grep.stdout.on 'data', (data) -> console.log data

# error handling for both
find.stderr.on 'data', (data) -> console.log 'grep stderr: ' + data
grep.stderr.on 'data', (data) -> console.log 'grep stderr: ' + data

# and exit handling for both
find.on 'exit', (code) ->
  console.log 'find process exited with code ' + code if code isnt 0

  # go ahead and end grep process
  grep.stdin.end()

grep.on 'exit', (code) -> console.log 'grep process exited with code ' + code if code isnt 0
