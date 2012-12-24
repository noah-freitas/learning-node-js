cmd = require('child_process').spawn 'cmd', ['/c', 'dir\n']

cmd.stdout.on 'data', (data) -> console.log 'stdout: ' + data

cmd.stderr.on 'data', (data) -> console.log 'stderr: ' + data

cmd.on 'exit', (code) -> console.log 'child process exited with code ' + code
