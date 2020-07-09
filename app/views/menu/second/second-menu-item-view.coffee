View = require "views/view"
template = require "views/templates/menu/second-menu-item"
RakerView = require "views/filters/raker-view"
RakerFactory = require "factories/raker-factory"
nextTransitionEnd = require "lib/next-transition-end"
Mediator = require "mediator"
Raker = require "collections/raker"

class SecondMenuItemView extends View
  className: "second-menu-item"
  template: template

  afterRender: =>
    @$el.addClass @options.key
    @rakerContainer = @$ ".raker-container"
    data = _(@options.collections).chain().map (collection) =>
      _(window.data[collection].models).filter(@options.filter || -> yes)
    .flatten().value()

    @raker = RakerFactory.build @options.filters, data, @options.key

    unless _(@options.filters).isEmpty()
      @rakerView = new RakerView collection: @raker
      @rakerContainer.append @rakerView.render().el

    link = @$ "a"
    link.bind "mclick", @onClick

  onClick: =>
    @trigger "click", @
    no

  open: (callback) =>
    return callback?() if @opened
    Mediator.publish "raker:store", "main"
    calculate = _.throttle @calculateRakerHeight, 1000
    $(window).bind 'resize', ->
      calculate()

    if @rakerView
      @rakerView.open =>
        @opened = yes
        _.defer =>
          @$el.addClass "opened"
          @calculateRakerHeight()
        setTimeout callback, 200 if callback
    else
      @opened = yes
      _.defer =>
        @$el.addClass "opened"
        @calculateRakerHeight()
      callback?()

    setTimeout =>
      Mediator.publish "raker:set", "main", @raker
    , 200

  close: (callback) =>
    return callback?() unless @opened
    @rollUpRaker()
    @$el.removeClass "opened"
    if @rakerView
      setTimeout =>
        @rakerView.close =>
          @opened = no
          callback?()
      , 200
    else
      @opened = no
      callback?()

    Mediator.publish "items-list:hide"
    setTimeout  =>
      Mediator.publish "raker:restore", "main"
    , 200

  rollUpRaker: =>
    @rakerContainer.height 1
    $(window).trigger "iscroll-refresh"

  calculateRakerHeight: =>
    @rakerContainer.height $(window).height() - @rakerContainer.offset().top - 47
    @rakerView.iScrollRefresh()

module.exports = SecondMenuItemView