Filter = require 'models/filter'

module.exports = class RangeFilter extends Filter

  constructor: (options, data) ->
    super options, data
    values = _(data).map (o) ->
      val = parseFloat(o.get(options.field))
      return 0 if _.isNaN(val)
      parseFloat o.get(options.field)

    min = _.min(values)
    max = _.max(values)
    @set "min", min
    @set "max", max
    @set "left", min
    @set "right", max

  match: (obj) =>
    value = parseFloat obj.get(@get("field"))
    left = parseFloat @get("left")
    right = parseFloat @get("right")
    value <= right and value >= left

  # check if filter is needed
  isNeeded: (source) =>
    ret = false
    field = @get 'field'
    _(source).reduce (acc, object) =>
      if acc >= 1
        ret = true
        return
      value = object.get field
      if value?
        acc = acc + 1
    , 0
    ret