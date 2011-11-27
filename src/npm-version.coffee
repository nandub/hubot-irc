Fs   = require 'fs'
json = Fs.readFileSync "#{__dirname}/../package.json"
pkg  = JSON.parse(json)
console.log pkg.version
