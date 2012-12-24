dns = require 'dns'

dns.lookup 'burningbird.net', (err, ip) -> 
  throw err if err?
  console.log ip

dns.reverse '173.255.206.103', (err, domains) ->
  console.log domain for domain in domains
