Collection = require 'collections/collection'
TransformerSubstation     = require "models/infrastructural-objects/transformer-substation"

class TransformerSubstations extends Collection
  model: TransformerSubstation

module.exports = TransformerSubstations