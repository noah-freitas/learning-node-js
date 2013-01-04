http = require 'http'
async = require 'async'
redis = require 'redis'
jade = require 'jade'

# set up Jade template
layout = require('fs').readFileSync "#{__dirname}/9-2_score.jade", 'utf8'
fn = jade.compile layout, filename: "#{__dirname}/9-2_score.jade"

# start Redis client
client = redis.createClient()

# select fifth database
client.select 5

# helper function
makeCallbackFunc = (member) ->
  (callback) -> client.hgetall member, (err, obj) -> callback err, obj

server = http.createServer (req, res) ->

  # first filter out icon request
  if req.url is '/favicon.ico'
    res.writeHead 200, 'Content-Type': 'image/x-icon'
    res.end()
    return

  # get scores, reverse order, top five only
  client.zrevrange 'Zowie!', 0, 4, (err, results) ->
    scores = null

    if err
      console.log err
      res.end 'Top scores not currently available, please check back'
      return

    # create array of callback functions for Async.series call
    callFunctions = []

    # process results with makeCallbackFunc, push newly returned
    # callback into array
    (callFunctions.push makeCallbackFunc result for result in results)

    # using Async series to process each callback in turn and return
    # end result as array of objects
    async.series callFunctions, (err, result) ->
      if err
        console.log err
        res.end 'Scores not available'
        return

      # pass object array to template engine
      str = fn scores: result
      res.end str

server.listen 3000

console.log 'Server running on 3000/'
