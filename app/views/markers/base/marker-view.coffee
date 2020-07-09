View = require 'views/view'

module.exports = class MarkerView extends View
  getLatLng: =>
    @marker.getLatLng()

  toString: =>
    "#{@model.className()}#{@model.id}View"