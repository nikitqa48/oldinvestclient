PolygonMarkerView = require "views/markers/base/polygon-marker-view"
module.exports = class IndustrialParkMarkerView extends PolygonMarkerView
  styles:
    defaultStyle:
      transitionProperty: "fill-opacity"
      transitionDuration: "2s"
      weight: 5
      color: 'blue'
      fillOpacity: 0.5
      fillColor: 'blue'
    activeStyle:
      transitionProperty: "fill-opacity"
      transitionDuration: "2s"
      weight: 1
      color: 'red'
      fillOpacity: 0.1
      fillColor: 'brown'
    openedStyle:
      transitionProperty: "fill-opacity"
      transitionDuration: "2s"
      weight: 1
      color: 'red'
      fillOpacity: 0.1
      fillColor: 'brown'