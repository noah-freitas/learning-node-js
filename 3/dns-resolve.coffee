dns = require 'dns'
dns.resolve 'burningbird.net', 'NS', (err, domains) ->
  console.log domain for domain in domains
