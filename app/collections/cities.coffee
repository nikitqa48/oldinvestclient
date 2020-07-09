City        = require 'models/city'
Collection  = require 'collections/collection'

class Cities extends Collection
  model: City

module.exports = Cities