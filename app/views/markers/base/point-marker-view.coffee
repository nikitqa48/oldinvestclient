MarkerView = require "views/markers/base/marker-view"

module.exports = class PointMarkerView extends MarkerView
  initialize: ->
    super
    @active = no
    @opened = no
    point = @model.point()
    icon = L.divIcon @iconOptions()
    @marker = L.marker(_(point).clone(), {icon: icon})
    @marker.object = @model
    @marker.bindPopup "", @popupOptions()
    @marker.on "popupopen", => @toggleActive yes
    @marker.on "popupclose", => @toggleActive no
    @el = @marker

  iconOptions: =>
    modelType = _(@model.className()).chain().dasherize().trim("-").value()
    {
        iconSize: [40, 40]
        iconAnchor: [20, 20]
        className: "bubble #{modelType}-marker",
        html: "<div class='outer-circle'></div><div class='inner-circle'>"
    }

  clusterIconOptions: (objects) =>
    iconOptions = @iconOptions()
    _.extend iconOptions, 
        html: "#{iconOptions.html}<div class='count'>#{objects.length}</div>"

  popupOptions: =>
    offset: L.point(-52, -28)
    autoPanPadding: L.point(10, 10)
    closeButton: false
    items: [@model]

  toggleActive: (v) =>
    @active = v
    $(@marker._icon).toggleClass "active", v

  toggleOpened: (v) =>
    @opened = v
    $(@marker._icon).toggleClass "opened", v