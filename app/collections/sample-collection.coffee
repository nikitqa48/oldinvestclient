Collection = require 'collections/collection'
Sample     = require "models/infrastructural-objects/sample"

class Samples extends Collection
  model: Sample

module.exports = Samples