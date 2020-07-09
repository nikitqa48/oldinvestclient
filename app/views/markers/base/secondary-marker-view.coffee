PointMarkerView = require "views/markers/base/point-marker-view"

class SecondaryMarkerView extends PointMarkerView
  iconOptions: =>
    _.extend super,
      iconSize: [34, 34]
      iconAnchor: [17, 17]
      className: "secondary-marker #{super.className}"
  popupOptions: =>
    _.extend super,
      offset: L.point(-52, -20)

module.exports = SecondaryMarkerView