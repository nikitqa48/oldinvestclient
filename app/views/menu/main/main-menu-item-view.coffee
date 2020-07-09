View = require "views/view"
template = require "views/templates/menu/main-menu-item"
SecondMenuView = require "views/menu/second/second-menu-view"
nextTransitionEnd = require "lib/next-transition-end"
Mediator = require "mediator"
Raker = require "collections/raker"

class MainMenuItemView extends View
  className: "main-menu-item"
  template: template
  selected: false

  afterRender: =>
    @$el.addClass @options.key
    @$el.attr index: @options.index

    @link = @$ "a"
    @link.bind "mclick", @onClick

    unless _.isEmpty @options.children
      @secondMenuView = new SecondMenuView list: @options.children
      @$el.append @secondMenuView.render().el

  onClick: =>
    Mediator.publish "menu:main:select", !@opened && @
    no

  open: (callback) =>
    @opened = yes
    if @secondMenuView
      @secondMenuView.open callback
    else
      callback?()

  close: (callback) =>
    Mediator.publish "raker:restore", "main"
    @opened = no
    if @secondMenuView
      @secondMenuView.close callback
    else
      callback?()

  afterOpen: () =>
    classes = _(@options.children).chain().pluck("collections").flatten().uniq().value()
    source = []
    for klass in classes
      source.push data[klass].models
    source = _.flatten source
    
    raker = new Raker source, [], key: "hide-list"

    Mediator.publish "raker:store", "main"
    Mediator.publish "raker:set", "main", raker

module.exports = MainMenuItemView