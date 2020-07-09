MarkerView = require 'views/markers/base/marker-view'

module.exports = class PolygonMarkerView extends MarkerView
  styles:
    defaultStyle:
      transitionProperty: "fill-opacity"
      transitionDuration: "2s"
      weight: 1
      color: '#324'
      fillOpacity: 0
      fillColor: '#324'
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

  initialize: ->
    super

    # For usage example see 
    # municipality-marker.view
    @hoverStyle   = @styles.hoverStyle
    @activeStyle  = @styles.activeStyle
    @openedStyle  = @styles.openedStyle
    @defaultStyle = @styles.defaultStyle

    points = @model.points()
    @polygon = L.polygon _(points).clone(), @styles.defaultStyle
    @polygon.bindPopup "", @popupOptions()
    @polygon.on "popupopen", => @toggleActive yes
    @polygon.on "popupclose", => @toggleActive no    
    @el = @polygon

  # Get polygon centroid
  # returns leaflet LatLng object
  centroid: =>
    @polygon.getBounds().getCenter()

  getLatLng: =>
    @model.point()

  popupOptions: =>
    offset: L.point(-52, 0)
    autoPanPadding: L.point(10, 10)
    closeButton: false
    items: [@model]

  setStyle: (style) =>
    @polygon.setStyle _.extend @polygon.options, style

  toggleActive: (isActive) =>
    @isActive = isActive
    if isActive and !@presentationMode then @setStyle @activeStyle else @setStyle @defaultStyle

  toggleOpened: (isOpened) =>
    if isOpened and !@presentationMode then @setStyle @openedStyle else @setStyle @defaultStyle