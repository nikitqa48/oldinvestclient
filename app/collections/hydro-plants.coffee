Collection = require 'collections/collection'
HydroPlant     = require "models/infrastructural-objects/hydro-plant"

class HydroPlants extends Collection
  model: HydroPlant

module.exports = HydroPlants