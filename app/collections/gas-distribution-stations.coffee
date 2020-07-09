Collection            = require 'collections/collection'
GasDistributionStation = require 'models/infrastructural-objects/gas-distribution-station'

class GasDistributionStations extends Collection
  model: GasDistributionStation

module.exports = GasDistributionStations