Filter = require 'models/filter'

module.exports = class LayerFilter extends Filter
  layers:
    platforms:
      order: 2
      types: ["platform", "city", "company", "naturalResource", "municipality", "specialEconomicZone", "infrastructuralObject"]

    projects:
      order: 1
      types: ["project", "city", "company", "naturalResource", "municipality", "specialEconomicZone", "infrastructuralObject"]

#    culturalHeritages:
#      order: 3
#      types: ["culturalHeritage", "city", "company"]

  match: (object) ->
    if(object.isInfoLayer)
      return true
    layer = @layers[@get("layer")] or {}
    types = layer.types or []
    _(types).include object.type()