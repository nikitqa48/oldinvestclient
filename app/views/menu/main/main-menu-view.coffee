View = require "views/view"
Schema = require "config/schema"
Mediator = require "mediator"
MainMenuItemView = require "views/menu/main/main-menu-item-view"
nextTransitionEnd = require "lib/next-transition-end"
template = require "views/templates/menu/main-menu"

class MainMenuView extends View
  autoRender: true
  id: "main-menu"
  region: "main-menu"
  template: template

  afterRender: =>
    @views = []
    @mainMenuItemViews = for mainMenuItemData, i in Schema
      # It is better to use a Backbone model here instead of plain hash
      mainMenuItemView = new MainMenuItemView _(mainMenuItemData).extend(index: i)
      @$el.append mainMenuItemView.render().el
      mainMenuItemView

    Chaplin.mediator.subscribe "menu:main:select", @onSelect
    Chaplin.mediator.subscribe "menu:main:activate", @activate

  onSelect: (mainMenuItemView) =>
    @selected = mainMenuItemView

    mainMenuItemViewsToClose = _(@mainMenuItemViews).without(@selected)

    closeCallback = _.after mainMenuItemViewsToClose.length, (selected) =>
      @changeState selected
      setTimeout () ->
        selected.open selected.afterOpen
      , 200 if selected

    for mainMenuItemView in mainMenuItemViewsToClose
      mainMenuItemView.close => closeCallback(@selected)

  activate: =>
    index = @$el.attr "index"
    @$el.attr
      state: "active"
      index: index || ""

    setTimeout (=> @$el.addClass "minimize"), 0
    Chaplin.mediator.publish "site:state", "blur", no

  changeState: (selected) =>
    @minimize = yes
    index = selected?.options?.index
    @$el.attr
      index: if index? then index else "" 
      state: "active"

    setTimeout (=> @$el.addClass "minimize", selected), 0
    Chaplin.mediator.publish "site:state", "blur", no
    
module.exports = MainMenuView