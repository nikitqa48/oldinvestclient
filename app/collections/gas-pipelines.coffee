Collection = require 'collections/collection'
GasPipeline     = require "models/infrastructural-objects/gas-pipeline"

class GasPipelines extends Collection
  model: GasPipeline

module.exports = GasPipelines