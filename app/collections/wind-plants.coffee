Collection = require 'collections/collection'
WindPlant     = require "models/infrastructural-objects/wind-plant"

class WindPlants extends Collection
  model: WindPlant

module.exports = WindPlants