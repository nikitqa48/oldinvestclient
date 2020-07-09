PolygonMarkerView = require "views/markers/base/polygon-marker-view"

module.exports = class ClusterMarkerView extends PolygonMarkerView
  styles:
    defaultStyle:
      transitionProperty: "fill-opacity"
      transitionDuration: "2s"
      weight: 2
      color: "red"
      fillOpacity: 0.2
      fillColor: 'white'
    activeStyle:
      transitionProperty: "fill-opacity"
      transitionDuration: "2s"
      weight: 2
      color: '#1C1C8B'
      fillOpacity: 0.3
      fillColor: '#1C1C8B'
    openedStyle:
      transitionProperty: "fill-opacity"
      transitionDuration: "2s"
      weight: 5
      color: '#1C1C8B'
      fillOpacity: 0.3
      fillColor: '#1C1C8B'