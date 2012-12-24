execfile = require('child_process').execFile

child = execfile './app.js', (error, stdout, stderr) ->
  console.log 'stdout: ' + stdout if (error == null)
