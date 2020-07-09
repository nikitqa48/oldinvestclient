Collection = require 'collections/collection'
WastewaterTreatmentPlant     = require "models/infrastructural-objects/wastewater-treatment-plant"

class WastewaterTreatmentPlants extends Collection
  model: WastewaterTreatmentPlant

module.exports = WastewaterTreatmentPlants