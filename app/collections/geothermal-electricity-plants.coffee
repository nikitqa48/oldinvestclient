Collection = require 'collections/collection'
GeothermalElectricityPlant     = require "models/infrastructural-objects/geothermal-electricity-plant"

class GeothermalElectricityPlants extends Collection
  model: GeothermalElectricityPlant

module.exports = GeothermalElectricityPlants