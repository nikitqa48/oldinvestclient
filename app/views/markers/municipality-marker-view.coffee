Mediator = require "mediator"
PolygonMarkerView = require "views/markers/base/polygon-marker-view"

module.exports = class MunicipalityMarkerView extends PolygonMarkerView
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
      fillOpacity: 0.4
      fillColor: 'brown'
    openedStyle:
      transitionProperty: "fill-opacity"
      transitionDuration: "2s"
      weight: 1
      color: 'red'
      fillOpacity: 0.1
      fillColor: 'brown'
    hoverStyle:
      transitionProperty: "fill-opacity"
      transitionDuration: "2s"
      weight: 1
      color: 'red'
      fillOpacity: 0.2
      fillColor: 'brown'

  initialize: =>
    super

    @toggleHover yes
    Mediator.subscribe "presentation:start", () => @toggleHover no
    Mediator.subscribe "presentation:stop", () => @toggleHover yes

    # Disable hover on zoom levels below 10
    window.map.on 'zoomend', (e) => 
      if map.getZoom() > 10
        @hoverStyle = @styles.defaultStyle
        @setStyle @defaultStyle
      else
        @hoverStyle = @styles.hoverStyle
        
    Mediator.subscribe "presentation:start", (callback) =>
      @presentationMode = true
      callback?(@)
    Mediator.subscribe "presentation:stop", @resetStyle
    @

  showLabel: (content) =>
    @polygon.bindLabel content

  hideLabel: =>
    @polygon.unbindLabel()

  onHover: (e, isOn) =>
    if isOn
      @setStyle @hoverStyle
      $("#tooltip span").html @model.name()
      $("#tooltip").show()
    else
      if !@isActive
        @setStyle @defaultStyle
      $("#tooltip").hide()
    false

  toggleHover: (isHover) =>
    if isHover and !@presentationMode
      onHover = _.debounce @onHover, 100
      @polygon.on 'mouseover', (e) => onHover e, yes
      @polygon.on 'mouseout', (e) => onHover e, no
    else
      @polygon.removeEventListener 'mouseover'
      @polygon.removeEventListener 'mouseout'

  # Reset all styles to defaults
  resetStyle: =>
    @presentationMode = false
    @hoverStyle   = @styles.hoverStyle
    @activeStyle  = @styles.activeStyle
    @defaultStyle = @styles.defaultStyle
    @polygon.setStyle @styles.defaultStyle

  toggleActive: (isActive)=>
    if map.getZoom() > 10
      super no
    else super isActive