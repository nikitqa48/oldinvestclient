Mediator = require "mediator"
SecondaryMarkerView = require "views/markers/base/secondary-marker-view"

module.exports = class CityMarkerView extends SecondaryMarkerView
  initialize: =>
    super
    @marker.unbindPopup()
    @marker.on "click", (e) =>
      Mediator.publish '!router:route', routeFor('items', @model)

    # Calculate distance to Lipetsk
    [lat, lng] = config.administrative_centre_latlng
    LatLngA = @getLatLng()
    LatLngB = L.latLng lat, lng

    # format: lng/lat
    featureArc = new arc.Coord LatLngA.lng, LatLngA.lat
    lipetskArc = new arc.Coord lng, lat

    # Build arcline
    gc = new arc.GreatCircle featureArc, lipetskArc
    line = gc.Arc 6
    arcLine = L.geoJson line.json()

    @marker.on "mouseover", (e) =>
      window.map.addLayer arcLine
    @marker.on "mouseout", (e) =>
      window.map.removeLayer arcLine

    # Add label to marker
    name = @model.get 'name'
    distance = Math.round LatLngA.distanceTo(LatLngB) / 1000
    label = if distance == 0 then "#{name}" else "#{name}<br/>#{t('titles.distance_to_lipetsk')}: #{distance} #{t('currency.km')}"
    @marker.bindLabel label

    # Unbind popup
    @marker.unbindPopup()
    @marker.on "click", (e) =>
      window.map.removeLayer arcLine
      Mediator.publish '!router:route', routeFor('items', @model)

  noCluster: yes