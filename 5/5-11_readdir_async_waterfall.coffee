fs = require 'fs'
async = require 'async'
_dir = './data/'

writeStream = fs.createWriteStream './log.txt',
  flags: 'a'
  encoding: 'utf8'
  mode: 0666

try
  async.waterfall [
    (callback) -> fs.readdir _dir, (err, files) -> callback err, files
    (files, callback) -> (callback null, name for name in files)
    (file, callback) -> fs.stat _dir + file, (err, stats) -> callback err, stats, file
    (stats, file, callback) -> 
      if stats.isFile()
        fs.readFile _dir + file, 'utf8', (err, data) -> callback err, file, data
    (file, text, callback) -> 
      adjdata = text.replace /somecompany\.com/g, 'burningbird.net'
      callback null, file, adjdata
    (file, text, callback) -> fs.writeFile _dir + file, text, (err) -> callback err, file
    (file, callback) -> writeStream.write "changed #{file} \n", 'utf8', (err) -> callback err, file
  ], (err, result) -> throw err if err; console.log "modified #{result}"
catch err
  console.log err
