Collection = require 'collections/collection'
HeatingMain     = require "models/infrastructural-objects/heating-main"

class HeatingMains extends Collection
  model: HeatingMain

module.exports = HeatingMains