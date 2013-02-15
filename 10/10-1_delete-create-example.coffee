mongodb = require 'mongodb'

server = new mongodb.Server 'localhost', 27017, auto_reconnect: true
db = new mongodb.Db 'exampleDb', server, safe: false

# open database connection
db.open (err, db) ->
  if not err
    # access or create widgets collection
    db.collection 'widgets', (err, collection) ->
      # remove all widgets documents
      collection.remove null, { safe: true }, (err, result) ->
        if not err
          console.log "result of remove #{result}"

          # create two records
          widget1 =
            title: 'First Great widget'
            desc: 'greatest widget of all'
            price: 14.99
          widget2 =
            title: 'Second Great widget'
            desc: 'second greatest widget of all'
            price: 29.99

          collection.insert widget1

          collection.insert widget2, { safe: true }, (err, result) ->
            if err then console.log err else console.log result

            # close database
            db.close()
