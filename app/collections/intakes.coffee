Collection = require 'collections/collection'
Intake     = require "models/infrastructural-objects/intake"

class Intakes extends Collection
  model: Intake

module.exports = Intakes