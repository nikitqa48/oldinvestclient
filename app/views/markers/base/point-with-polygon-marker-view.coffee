PointMarkerView = require "views/markers/base/point-marker-view"

module.exports = class PointWithPolygonMarkerView extends PointMarkerView
  type: 'point'

  initialize: ->
    super
    points = @model.points()
    @polygon = L.polygon _(points).clone(), @polygonOptions()

    onAdd = @marker.onAdd
    onRemove = @marker.onRemove

    @marker.onAdd = (map) =>
      onAdd.apply @marker, arguments
      map.addLayer @polygon

    @marker.onRemove = (map) =>
      onRemove.apply @marker, arguments
      map.removeLayer @polygon

    @el = @marker

  polygonOptions: =>
    weight: 2
    color: "#2891db"
    fillOpacity: 0.05