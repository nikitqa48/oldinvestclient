module.exports = class Collection extends Backbone.Collection
  findBy: (name, value) ->
    condition = {}
    condition[name] = value
    @where(condition)[0]

  searchSortValue: (key) ->
    _(@.pluck(key)).chain().map(parseFloat).compact().sortBy((num) -> num)

  minValue: (key) ->
    @.searchSortValue(key).first().value()

  maxValue: (key) ->
    @.searchSortValue(key).last().value()