redis = require 'redis'

# home page
exports.index = (req, res) -> res.render 'index', title: 'Express'

# stats
exports.stats = (req, res) ->
  client = redis.createClient()

  client.select 2

  # Redis transaction to gather data
  transaction = client.multi()
  transaction.smembers 'ip'
  transaction.hgetall 'myurls'
  transaction.exec (err, results) ->
    ips = results[0]
    urls = results[1]
    res.render 'stats', title: 'Stats', ips: ips, urls: urls
    client.quit()
