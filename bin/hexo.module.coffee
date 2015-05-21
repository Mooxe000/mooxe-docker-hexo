Toa = require 'toa'

toaStatic = (
  require 'toa-static'
)(
  'dist'
)

module.exports = ->
  app = Toa()
  app.use toaStatic
  app.listen 3000
