Mediator            = require "mediator"
Raker               = require "collections/raker"
RakerFactory        = require "factories/raker-factory"
PresentationView    = require "views/presentation-view"
SecondMenuItemView  = require "views/menu/second/second-menu-item-view"

class PresentationMenuItemView extends SecondMenuItemView

  initialize: (data) =>
    @data = data
    super

  afterRender: =>
    @$el.addClass @options.key
    @rakerContainer = @$ ".raker-container"

    link = @$ "a"
    link.bind "mclick", @onClick
    Mediator.subscribe "presentation:menu:close", @closeChoosen

  onClick: =>
    @trigger "click", @
    no

  open: (callback) =>
    unless @opened
      @$el.addClass "opened"
      @presentationView = new PresentationView @data
      _.defer =>
        @opened = yes 
        @presentationView.open()

  close: (callback) =>
    if @opened
      @$el.removeClass "opened"
#      Mediator.publish "raker:unset", "main"
      super
      @presentationView?.close()

  closeChoosen: (key) =>
    if @options.key == key
      @trigger "click", @

module.exports = PresentationMenuItemView