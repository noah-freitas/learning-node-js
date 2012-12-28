connect = require 'connect'
http = require 'http'
fs = require 'fs'

writeStream = fs.createWriteStream './log.txt',
  flags: 'a'
  encoding: 'utf8'
  mode: 0666

http.createServer(
  connect()
    .use(connect.logger format: 'dev', stream: writeStream )
    .use connect.static __dirname
).listen 8124
