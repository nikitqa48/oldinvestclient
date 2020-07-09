MarkerContentViews  = {}
View                = require "views/view"
Mediator            = require "mediator"
template            = require "views/templates/map"
Collection          = require "collections/collection"
BufferedMediator    = require "lib/buffered-mediator"
MarkerViewFactory   = require "factories/marker-view-factory"
MarkerGroupFactory  = require "factories/marker-group-factory"
MarkerContentView   = require "views/markers/base/marker-content-view"
Raker = require "collections/raker"

class MapView extends View
  autoRender: true
  id: "map"
  region: "map"
  template: template
  markersGeneration: 0
  markerViews: []
  history: []

  initialize: ->
    super
    @mapDebounceUnion = _( =>
      if @map
        args = Array::slice.call(arguments)
        f = args.shift()
        f.apply @map, args
    ).debounce(300)
    $(window).bind "drop-cache", MarkerViewFactory.clearCache
    @data = new Collection
    @data.bind "add", @addMarker
    @data.bind "remove", @removeMarker
    window.mapView = @

  afterRender: =>
    _.defer =>
      L.Icon.Default.imagePath = "images/leaflet/"
      window.map = map = @map = L.map(@el,
        zoomControl: false
        attributionControl: false
        minZoom: config.minZoom
        maxZoom: config.maxZoom
      )

      @map.on "mousedown touchstart", =>
        $(window).trigger "map:click"

      @map.fitBounds window.config.defaultBounds
      @map.on "popupopen", @openPopup
      @map.on "mousedown", -> $(window).trigger "filter-close"
      @storePosition()
      L.control.zoom(position: "bottomright").addTo @map
      fullMap = L.Control.extend
        options:
          position: 'bottomright'
          className: 'full'
        onAdd: (map) =>
          container = L.DomUtil.create('div', 'full-size-button')
          $(container).bind "mclick", =>
            @map.fitBounds window.config.defaultBounds
          container

      @map.addControl(new fullMap());
      L.tileLayer(window.config.tiles.url, window.config.tiles.options).addTo @map
      @rakers = {}
      Mediator.subscribe "raker:set", @setRaker
      Mediator.subscribe "raker:unset", @unsetRaker
      Mediator.subscribe "map:startScreen", @startScreen
      Mediator.subscribe "map:object:close", @closeObject

      _.defer =>
        Mediator.publish "raker:set", "main",             window.defaultRaker
        Mediator.publish "raker:set", "infrastructure",   window.infraRaker
        Mediator.publish "raker:set", "municipalities",   window.municipalitiesRaker
        Mediator.publish "raker:set", "naturalResources", window.naturalResourcesRaker
        Mediator.publish "raker:set", "cities",           window.citiesRaker
        
        BufferedMediator.subscribe "map:object:open", @showObject

      showDistanceToMoscow = _.debounce @showDistanceToMoscow, 100
      map.on 'mousemove', (e) => showDistanceToMoscow e.latlng

      # Place cities on map
      $.getJSON "data/russian-cities.geojson", (data) =>
        [latB, lngB] = config.administrative_centre_latlng

        # format: lng/lat
        lipetskArc = new arc.Coord lngB, latB

        citiesMarkers = L.geoJson data,
          pointToLayer: (feature, latlng) =>
            new L.Marker latlng,
              icon: new L.Icon
                iconSize: [30, 30]
                iconUrl: 'images/city-marker.png'
          onEachFeature: (feature, layer) =>
            [lngA, latA] = feature.geometry.coordinates

            # format: lng/lat
            featureArc = new arc.Coord(lngA, latA)
            gc = new arc.GreatCircle(featureArc, lipetskArc)
            line = gc.Arc 12
            arcLine = L.geoJson line.json()

            name = feature.properties.NAME
            distance = @distance L.latLng(latA, lngA), L.latLng(latB, lngB)
            layer.bindLabel "#{name}<br/>#{t('titles.distance_to_lipetsk')}: #{distance} #{t('currency.km')}"

            layer.on "mouseover", (e) => window.map.addLayer    arcLine
            layer.on "mouseout",  (e) => window.map.removeLayer arcLine
        @citiesMarkerClusterGroup = new L.MarkerClusterGroup
          maxClusterRadius: 40
          showCoverageOnHover: false
          disableClusteringAtZoom: 4
          iconCreateFunction: (cluster) => new L.Icon
            iconSize: [30, 30]
            iconUrl: 'images/city-marker.png'
        @citiesMarkerClusterGroup.on 'clusterclick', (a) => map.setView a.latlng, 4
        @citiesMarkerClusterGroup.addLayer citiesMarkers
        window.map.addLayer @citiesMarkerClusterGroup
        @citiesMarkerClusterGroup.bringToBack()

        @map.on "zoomend", (e) => 
          if map.getZoom() <= 2
            Mediator.publish "raker:store", "cities"
            Mediator.publish "raker:unset", "cities"
          else
            Mediator.publish "raker:restore", "cities"

      $.getJSON "data/geography.geojson", (data) =>
        regionBoundary = L.geoJson data
        regionBoundary.setStyle
          color: "#E1582E"
          weight: 5
          opacity: 0.5
          fillOpacity: 0
        window.map.addLayer regionBoundary
        regionBoundary.bringToBack()
        window.map.fitBounds regionBoundary.getBounds()

  # Returns the distance (in km) to the given LatLng calculated using the Haversine formula.
  distance: (LatLngA, LatLngB) =>
    Math.round LatLngA.distanceTo(LatLngB) / 1000

  showDistanceToMoscow: (LatLng) =>
    MoscowLatLng = L.latLng 55.751667, 37.617778
    distance = Math.round @distance LatLng, MoscowLatLng
    $("#distanceToMoscow").show()
    $("#distanceToMoscow span").html "#{t('titles.distance_to_moscow')}: #{distance} #{t('currency.km')}"

  hideDistanceToMoscow: () =>
    $("#distanceToMoscow").hide()

  setRaker: (key, raker) =>
    oldRaker = @rakers[key]
    unless oldRaker == raker
      if oldRaker
        oldRaker.data.unbind "add", @addObject
        oldRaker.data.unbind "remove", @removeObject
      @rakers[key] = raker
      if raker
        raker.data.bind "add", @addObject
        raker.data.bind "remove", @removeObject

        @data.set _(r?.data?.models for k, r of @rakers when r?.data?.models).flatten()

  getRaker: (key) =>
    @rakers[key]

  unsetRaker: (key) =>
    @setRaker key, null

  openPopup: (params) =>
    popup = params.popup
    items = popup.options.items

    # Use either specified marker content view or base marker content view classes
    className = items[0].className()
    if MarkerContentViews[className]
      @markerContentView = new MarkerContentViews[className](items: items)
    else
      @markerContentView = new MarkerContentView(items: items)

    popup.setContent @markerContentView.render().el
    @map.on "popupclose", @markerContentView.stopRenderItems

  addObject: (object) =>
    @data.add object

  removeObject: (object) =>
    @data.remove object

  addMarker: (object) =>
    if object.get("coords")
      markerView = MarkerViewFactory.get object
      if markerView.noCluster
        @map.addLayer markerView.el
      else
        markerGroup = MarkerGroupFactory.get markerView
        unless @map.hasLayer markerGroup
          @map.addLayer markerGroup
        markerGroup.addLayer markerView.el

  removeMarker: (object) =>
    if object.get("coords")
      markerView = MarkerViewFactory.get object
      markerGroup = MarkerGroupFactory.get markerView
      markerGroup.removeLayer markerView.el

  showObject: (object) =>
    @closeObject()
    return unless object.get("coords")
    @openedMarkerView = MarkerViewFactory.get object
    if @openedMarkerView
      markerClusterGroup = MarkerGroupFactory.get @openedMarkerView
      if @map.hasLayer @openedMarkerView.el

        # fit to point bounds
        if @openedMarkerView.polygon
          bounds = @openedMarkerView.polygon.getBounds()
        else
          bounds = new L.LatLngBounds [@openedMarkerView.getLatLng()]

        paddingLeft = Math.round(($(window).width()-534)/2)
        map.fitBounds bounds, paddingTopLeft: [paddingLeft, 0]
        if markerClusterGroup.hasLayer @openedMarkerView.el
          markerClusterGroup.removeLayer @openedMarkerView.el
        @map.addLayer @openedMarkerView.el
        @openedMarkerView.toggleActive no
        @openedMarkerView.toggleOpened yes
      else
        markerClusterGroup.zoomToShowLayer @openedMarkerView.el, =>
          markerClusterGroup.removeLayer @openedMarkerView.el
          @map.addLayer
          @openedMarkerView.el
          @openedMarkerView.toggleActive no
          @openedMarkerView.toggleOpened yes

  closeObject: =>
    if @openedMarkerView
      @openedMarkerView.toggleOpened no
      markerClusterGroup = MarkerGroupFactory.get @openedMarkerView
      if markerClusterGroup
        markerClusterGroup.addLayer @openedMarkerView.el

  storePosition: =>
    @history.push @map.getBounds() if @map

  restorePosition: =>
    if @map
      bounds = @history.pop()
      @mapDebounceUnion @map.fitBounds, bounds  if bounds

  clear: =>
    @markerViews = []

  startScreen: =>
    @map.setView [53.01, 158.65], 9
    @map.closePopup()

module.exports = MapView