Filter = require 'models/filter'
Collection = require 'collections/collection'

module.exports = class ChoiceFilter extends Filter
  defaults:
    matchedTypes: ["Platform"]
    foreignKey: "code"
    multiple: no
    allowBlank: yes

  initialize: =>
    @attributes.selected = new Collection

  getItem: (val) =>
    @get("items").findBy @foreignKey(), val

  itemsData: =>
    func = (obj) =>
      name: obj.get "name"
      value: obj.get @foreignKey()
      obj: obj
    @get("items").map func

  foreignKey: =>
    if @attributes.foreignKey is "id"
      foreignKey =  "dbId"
    else
      foreignKey =  @get "foreignKey"

  toggle: (item) =>
    if _(item).isObject()
      itemId = item.get @foreignKey()
    else
      itemId = item
    item = @get("items").findBy @foreignKey(), itemId
    # Get by id fot sure that this.items includes received object
    if @isSelected itemId
      @get("selected").remove item
    else
      @get("selected").add item
    @trigger "change"

  isSelected: (item) =>
    itemId = if _(item).isObject() then item.get(@foreignKey()) else item
    !!@get("selected").findBy(@foreignKey(), itemId)

  use: (objects) =>
    if @get "multiple"
      match = @multipleMatch
    else
      match = @singleMatch
    _(objects).filter (obj) =>
      return yes if @get("matchedTypes") and not _(@get("matchedTypes")).include(obj.className())
      match obj

  singleMatch: (obj) =>
    return @get("allowBlank") if @get("selected").length is 0
    value = obj.get(@get("field") + "_" + @get("foreignKey"))
    @isSelected value

  multipleMatch: (obj)=>
    return yes if @get("selected").length == 0
    if @attributes.foreignKey is "id" then foreignKey = "dbId" else @get("foreignKey")
    selectedCodes = @get("selected").pluck foreignKey
    hasManyKey = _.pluralize @get("field")
    itemCodes = _(obj.get(hasManyKey)).pluck foreignKey
    _.intersection(selectedCodes, itemCodes).length > 0

  # TODO: FIXME: do not use field and foreignKeyField at the same time, shema.coffee needs fix
  # check if filter is needed
  isNeeded: (source) =>
    field = @get("field") + "_" + @get("foreignKey")
    _(source).any (object) =>
      value = object.get field
      if value or value == 0
        true