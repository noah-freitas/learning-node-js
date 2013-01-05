spawn = require('child_process').spawn
net = require 'net'

client = new net.Socket
client.setEncoding 'utf8'

# connect to TCP server
client.connect '3000', 'localhost', -> console.log 'connected to server'

# start child process
logs = spawn 'tail', [
  '-f'
  #'/home/main/logs/access.log'
  #'/home/tech/logs/access.log'
  #'/home/shelleypowers/logs/access.log'
  #'/home/green/logs/access.log'
  #'/home/puppies/logs/access.log'
  "./log.txt"
]

# process child process data
logs.stdout.setEncoding 'utf8'
logs.stdout.on 'data', (data) ->
  # resource URL
  re = /GET\s(\S+)\sHTTP/g

  # graphics test
  re2 = /\.gif|\.png|\.jpg|\.svg/

  # extract URL, test for graphics
  # store in Redis if found
  parts = re.exec data
  console.log parts[1]
  tst = re2.test parts[1]
  client.write parts[1] if tst

logs.stderr.on 'data', (data) -> console.log "stderr: #{data}"

logs.on 'exit', (code) ->
  console.log "child process exited with code #{code}"
  client.end()
