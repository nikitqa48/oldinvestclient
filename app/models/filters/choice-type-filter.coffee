ChoiceFilter = require 'models/filters/choice-filter'

module.exports = class ChoiceTypeFilter extends ChoiceFilter.extend
  defaults:
    selected: []
    items: []

  select: (items) ->
    @set selected: items

  itemsData: ->
    func = $.proxy((el) ->
      name: t("objects." + _(el).chain().underscored().pluralize().value())
      value: el
      obj: el
    , this)
    _(@get("items")).map func

  toggle: (item) ->
    method = (if @isSelected(item) then "without" else "union")
    @set selected: _(@get("selected"))[method](item)

  isSelected: (item) ->
    _(@get("selected")).include item

  getItem: (key) ->
    key

  match: (obj) ->
    return true  if @get("selected").length is 0
    value = obj.type()
    _(value).isBlank() or @isSelected(value)