Filter = require 'models/filter'

module.exports = class SearchFilter extends Filter
  defaults:
    str: ""
    name: "search"
    limit: 100

  match: (object) ->
    object.searchString?.match(@regExp)?

  use: (objects) ->
    str = _(@get("str")).trim()
    wordsArr = _(str.split(" ")).compact()
    @regExp = new RegExp(".*" + wordsArr.join(".*") + ".*", "i")
    results = []
    for obj in objects
      break if results.length >= @get "limit"
      results.push obj if @get("matchedTypes") and not _(@get("matchedTypes")).include(obj.type()) or @match obj
    results