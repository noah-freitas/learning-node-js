fs = require 'fs'

writeStream = fs.createWriteStream './log.txt',
  flags: 'a'
  encoding: 'utf8'
  mode: 0666

try
  # get list of files
  fs.readdir './data/', (err, files) ->
    counter = 0

    modify_file = (name) ->
      # modify contents
      fs.readFile "./data/#{name}", 'utf8', (err, data) ->
        throw err if err?

        adjData = data.replace /somecompany\.com/g, 'burningbird.net'

        # write to file
        fs.writeFile "./data/#{name}", adjData, (err) ->

          throw err if err?

          # log write
          writeStream.write "changed #{name} \n", 'utf8', (err) ->
            throw err if err?

            console.log "finished #{name}"
            counter += 1
            console.log 'all done' if counter >= files.length
    
    # modify each file
    (modify_file(file) for file in files)

catch err
  console.error util.inspect err
