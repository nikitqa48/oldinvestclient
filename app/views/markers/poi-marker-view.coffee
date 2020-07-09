SecondaryMarkerView = require "views/markers/base/secondary-marker-view"
module.exports = class POIMarkerView extends SecondaryMarkerView
  iconOptions: =>
    modelType = _(@model.className()).chain().dasherize().trim("-").value()
    _.extend super,
      iconSize: [30, 30]
      iconAnchor: [17, 17]
      className: "bubble  #{modelType}-marker"
      html:  "</div><div class='inner-circle'><img src=#{@model.logo()}/></div>"