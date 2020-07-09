Collection = require 'collections/collection'
Sewer     = require "models/infrastructural-objects/sewer"

class Sewers extends Collection
  model: Sewer

module.exports = Sewers