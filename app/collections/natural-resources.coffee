Collection      = require 'collections/collection'
NaturalResource = require 'models/natural-resource'

class NaturalResources extends Collection
  model: NaturalResource

module.exports = NaturalResources