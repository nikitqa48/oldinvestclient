View              = require "views/view"
Mediator 			    = require "mediator"
template 			    = require "views/templates/filters/raker"
FilterViewFactory = require "factories/filter-views-factory"

class RakerView extends View
  className: "raker"
  template: template

  afterRender: =>
  	@scrollContainer = @$ ".scroll-container"
  	@scrollContainer.iScroll {}, (@iScroll) =>
    @filtersContainer = @$ ".filters"
    @views = @collection.map (filter) =>
      FilterViewFactory.build filter

    for view in @views
      @filtersContainer.append view.render().el

  iScrollRefresh: =>
    @iScroll.refresh()

module.exports = RakerView