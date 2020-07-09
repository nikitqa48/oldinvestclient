Collection = require 'collections/collection'
DieselPowerPlant     = require "models/infrastructural-objects/diesel-power-plant"

class DieselPowerPlants extends Collection
  model: DieselPowerPlant

module.exports = DieselPowerPlants