SearchString =
  init: (attrs) ->
    str = t("search.search_string." + _(@className()).underscored())
    attrs = attrs or ["name"]
    str + " " + _(attrs).reduce((str, attr) ->
      if @get(attr)
        str + " " + @get(attr)
      else
        str
    , "", this)

  initialize: ->
    @searchString = SearchString.init.apply(this)

module.exports = SearchString