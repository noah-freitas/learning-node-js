http = require 'http'
fs = require 'fs'

#write out numbers
writeNumbers = (res) ->
    counter = 0

    #increment global, write to client
    (res.write num.toString() + '\n' for num in [0..99])

# create http server
http.createServer((req, res) ->

    query = require('url').parse(req.url).query
    app = require('querystring').parse(query).file + ".txt"

    # content header
    res.writeHead 200, 'Content-Type': 'text/plain'

    # write out numbers
    writeNumbers res

    # timer to open file and read contents
    setTimeout () ->

        console.log 'opening ' + app
        # open and read in file contents
        fs.readFile app, 'utf8', (err, data) ->
        if err
            res.write 'Could not find or open file for reading\n'
        else
            res.write data

        # response is done
        res.end()
    , 2000
).listen process.env.PORT

console.log 'Server running at ' + process.env.PORT