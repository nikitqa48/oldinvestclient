View = require "views/view"
template = require "views/templates/filters/boolean-filter"

class BooleanFilterView extends View
  className: "filter boolean-filter"
  template: template

  afterRender: =>
    @checkbox = @$ ".checkbox"    
    @model.bind "change", @refresh
    @$el.bind "mclick", @toggle
    @refresh()

  toggle: =>
    @model.toggle()

  refresh: =>
    @checkbox.toggleClass "checked", !!@model.get "value"

module.exports = BooleanFilterView