PointMarkerView = require "views/markers/base/point-marker-view"

module.exports = class NaturalResourceMarkerView extends PointMarkerView
  initialize: ->
    @active = no
    @opened = no
    point = @model.point()

    icon = imageUrl @model.naturalResourceType().get('icon')
    html = "<div class='inner-circle'>
      <div class='icon'><img src='#{icon}'/></div>"

    icon = L.divIcon _.extend @iconOptions(),
      html: html

    @marker = L.marker _(point).clone(), 
      icon: icon

    @marker.object = @model
    @marker.bindPopup "", @popupOptions()
    
    @marker.on "popupopen", => @toggleActive yes
    @marker.on "popupclose", => @toggleActive no
    @el = @marker

  iconOptions: =>
    _.extend super,
      iconSize: []

  clusterIconOptions: (objects) =>
    # Get objects on unique natural_resource_type_code
    uniqueObjects = _(objects).uniq false, (object) ->
      object.get 'natural_resource_type_code'
    count = if uniqueObjects.length <= 3 then uniqueObjects.length else 'more'
    uniqueObjects = _(uniqueObjects).first 3

    # Reduce to string containing divs with icons
    icons = _(uniqueObjects).reduce (acc, object) ->
      icon = imageUrl object.naturalResourceType().get('icon')
      acc + "<div class='icon'><img src='#{icon}'/></div>"
    , ''

    html = "<div class='inner-circle uniq#{count}'>#{icons}</div>"

    _.extend super,
      html: html

  popupOptions: =>
    _.extend super,
      className: 'natural-resource-popup'