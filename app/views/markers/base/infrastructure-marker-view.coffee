PointMarkerView = require "views/markers/base/point-marker-view"

class InfrastructureMarkerView extends PointMarkerView
  iconOptions: =>
    _.extend super,
      iconSize: [20, 20]
      iconAnchor: [10, 10]
      className: "infrastructure-marker #{super.className}"
      html: "<div class='inner-circle'></div>"
  popupOptions: =>
    _.extend super,
      offset: L.point(-52, -13)

module.exports = InfrastructureMarkerView