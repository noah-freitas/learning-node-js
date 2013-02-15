mongodb = require 'mongodb'

server = new mongodb.Server 'localhost', 27017, auto_reconnect: true
db = new mongodb.Db 'exampleDb', server, safe: false

# open database connection
db.open (err, db) ->
  if not err

    # access or create widgets collection
    db.collection 'widgets', (err, collection) ->

      # update
      collection.update { id: 4 }, { $set: title: 'Super Bad Widget' }, { safe: true }, (err, result) ->
        if err
          console.log err
        else
          console.log result
          # query for updated record
          collection.findOne id: 4, (err, doc) ->
            if not err
              console.log doc

              # close database
              db.close()
