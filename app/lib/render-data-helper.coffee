template = require("views/templates/card/data-table")
valueFactory = require("factories/value-factory")

class RenderDataHelper
  constructor: (@model, @excluded) ->
    defaultExcluded = ["id", "created_at", "updated_at"]
    @moneyFields =
      project: ["investment"]
      platform: []

    @model = model
    @attributes = _.omit(model.attributes, _.union(defaultExcluded, excluded))

  renderTable: =>
    template
      attributes: @attributes
      nameConverter: @nameConverter
      valueConverter: @valueConverter
      _: _

  nameConverter: (k, sub) =>
    t(_(@model.className()).chain().underscored().pluralize().value() + ".attributes." + k)

  valueConverter: (v, key) =>
    match = key.match(/(\w+)_(?:code|id)/)
    if match?
      belongsTo = match[1]
      method = @model[_(belongsTo).camelize()]
      return method().get("name")  if method and method()

    # money
    if _(@moneyFields[@model.type]).include(key)
      return valueFactory.build(v, "rub",
        needText: true
      )

    # area
    return v + " " + t("area.he")  if key is "area"
    if v instanceof Array
      return _(v).map((num, key) ->
        num.name
      ).join(", ")
    v

module.exports = RenderDataHelper