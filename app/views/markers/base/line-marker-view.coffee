MarkerView = require "views/markers/base/marker-view"

class LineMarkerView extends MarkerView
  zIndex: 0
  initialize: ->
    super
    @active = no
    @opened = no    
    @points = @model.points()

    leafletPoints = for point in @points
      new L.LatLng point[0], point[1]

    @line = new L.Polyline leafletPoints,
      color: @color
      weight: 2
      smoothFactor: 1

    @line.bindPopup "", @popupOptions()
    @el = @line

  getLatLng: =>
    sumY = 0
    sumX = 0
    for point in @points
      sumX += point[0]
      sumY += point[1]
    new L.LatLng sumX/@points.length , sumY/@points.length

  popupOptions: =>
    offset: L.point(-50, -5)
    autoPanPadding: L.point(10, 10)
    closeButton: false
    items: [@model]

  toggleActive: (isActive) =>
    if isActive
      @line.setStyle
        color: @activeColor
    else
      @line.setStyle
        color: @color

  toggleOpened: (isOpened) =>
    if isOpened
      @line.setStyle
        color: @activeColor
    else
      @line.setStyle
        color: @color

module.exports = LineMarkerView