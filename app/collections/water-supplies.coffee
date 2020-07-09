Collection = require 'collections/collection'
WaterSupply     = require "models/infrastructural-objects/water-supply"

class WaterSupplies extends Collection
  model: WaterSupply

module.exports = WaterSupplies