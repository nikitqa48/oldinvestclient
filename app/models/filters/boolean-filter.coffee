Filter = require "models/filter"
Collection = require "collections/collection"

module.exports = class BooleanFilter extends Filter
  defaults:
    value: no
    matchedTypes: ["Platform"]
  
  toggle: (val = !@get "value") =>
    @set
      value: val

  match: (object) =>
    val = @get "value"
    key = @get "field"    
    !val || object.get(key) is val