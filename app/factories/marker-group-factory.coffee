class MarkerGroupFactory
  cache:
    {}

  markerClusterGroupOptions:
    city:
      maxClusterRadius: 20

  get: (markerView) =>
    modelType = _(markerView.model.className()).chain().dasherize().trim("-").value()

    defaultMarkerClusterGroupOptions = 
      iconCreateFunction: (cluster) ->
        objects = _(cluster.getAllChildMarkers()).pluck "object"
        L.divIcon _.extend markerView.clusterIconOptions(objects),
          objects: objects

      showCoverageOnHover: no
      zoomToBoundsOnClick: yes
      removeOutsideVisibleBounds: true # remove clusters and markers too far from the viewport for performance

    markerClusterGroupOptions = _.extend defaultMarkerClusterGroupOptions, @markerClusterGroupOptions[modelType]
    markerClusterGroup = @cache[modelType] = @cache[modelType] || new L.MarkerClusterGroup markerClusterGroupOptions

#    markerClusterGroup._featureGroup.on "layeradd", (e) =>
#      objects = e.layer._iconObj?.options.objects
#      if objects && objects.length > 0
#        popupOptions = markerView.popupOptions()
#        e.layer.bindPopup "", _.extend(popupOptions, items: objects)

    markerClusterGroup

module.exports = new MarkerGroupFactory