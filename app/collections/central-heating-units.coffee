Collection          = require 'collections/collection'
CentralHeatingUnit  = require 'models/infrastructural-objects/central-heating-unit'

class CentralHeatingUnits extends Collection
  model: CentralHeatingUnit

module.exports = CentralHeatingUnits