Model = require 'models/model'

module.exports = class Filter extends Model
  use: (objects) =>
    _(objects).filter (obj) =>
      return yes if @get "matchedTypes" and not _(@get "matchedTypes").include obj.className()
      @match obj

  serialize: =>
    JSON.stringify @attributes

  deserialize: (str) =>
    data = JSON.parse str
    @set data

  # check if filter is needed
  isNeeded: (source) =>
  	true