GeoObject =
  point: ->
    if not @__point and not _(@get("coords")).isBlank()
      coords = if _.isBlank @get("coords")
        []
      else
        _.map @get("coords").split("_"), (part) ->
          _.map part.split(","), parseFloat
      # _.mean imported from underscore.math
      @__point = _.compact [_(coords[0]).mean(), _(coords[1]).mean()]
    @__point

  points: ->
    if not @__points
      coords = if _.isBlank @get("coords")
        []
      else
        _.map @get("coords").split("_"), (part) ->
          _.map part.split(","), parseFloat
      @__points = _.zip.apply(this, coords)
    @__points

  line: ->
    if not @__points
      coords = if _.isBlank @get("coords")
        []
      else
        _.map @get("coords").split("_"), (part) ->
          _.map part.split(","), parseFloat
      @__points = _.zip.apply(this, coords)
    @__points


module.exports = GeoObject