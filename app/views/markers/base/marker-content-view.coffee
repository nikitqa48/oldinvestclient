View = require 'views/view'
Mediator = require "mediator"
template = require 'views/templates/marker-content'

class MarkerContentView extends View
  className: "marker-content",
  template: template,

  getTemplateData: =>
    _.extend super,
      items: @options.items

  afterRender: () =>
    @itemsList = @$ ".marker-content-list-item"
    @itemsList.bind "mclick", @showObject unless @itemsList.hasClass 'disable-click'

    @$el.iScroll scrollbarClass: 'marker-content-scroll-bar'

  showObject: (e) =>
    url = $(e.delegateTarget).data "url"
    Mediator.publish "!router:route", url if url

  stopRenderItems: () ->
    @timeoutId && clearTimeout @timeoutId

module.exports = MarkerContentView