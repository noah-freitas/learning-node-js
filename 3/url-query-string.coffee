url = require 'url'
querystring = require 'querystring'

urlObj = url.parse 'http://examples.burningbird.net:8124/?file=main'

qs = urlObj.query
console.log url.format urlObj

vals = querystring.parse 'file=main&file=secondary&type=html'

console.log vals.file[0]

qryString = querystring.stringify vals
