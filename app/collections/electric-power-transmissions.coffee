Collection = require 'collections/collection'
ElectricPowerTransmission     = require "models/infrastructural-objects/electric-power-transmission"

class ElectricPowerTransmissions extends Collection
  model: ElectricPowerTransmission

module.exports = ElectricPowerTransmissions