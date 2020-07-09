View = require "views/view"
SecondMenuItemFactory = require "factories/second-menu-item-factory"
nextTransitionEnd = require "lib/next-transition-end"

class SecondMenuView extends View
  className: "second-menu"

  afterRender: =>
    @childContainers = []
    @children = []
    @animateGeneration = 0
    _.each @options.list, (secondMenuItemData, i) =>
      secondMenuItemView = SecondMenuItemFactory.get secondMenuItemData
      secondMenuItemView.bind "click", (itemView) => @onItemClick itemView, i
      @children.push secondMenuItemView
      childContainer = $("<div>").addClass("second-menu-item-container").appendTo @$el
      @childContainers.push childContainer
      childContainer.append secondMenuItemView.render().el

  onItemClick: (itemView, index) =>
    @animateGeneration++
    if @selectedItemView == itemView
      @selectedItemView.close =>
        @selectedItemView = null
        @selectedIndex = null
        @animateChildren @animateGeneration, 0, 1
    else
      @selectedItemView = itemView
      @selectedIndex = index
      @animateChildren @animateGeneration, @childContainers.length - 1, -1, @selectedItemView.open

  open: (callback) =>
    @$el.addClass "opened"
    @animateGeneration++
    setTimeout =>
      @animateChildren @animateGeneration, 0, 1, =>
        @opened = yes
        callback?()
    , 0

  close: (callback) =>
    @animateGeneration++
    child.close() for child in @children
    @selectedItemView = null
    @selectedIndex = null
    @animateChildren @animateGeneration, @childContainers.length - 1, -1, =>
      @$el.removeClass "opened"
      @opened = no
      callback?()

  animateChildren: (generation, i = 0, step = 1, callback) =>
    if generation == @animateGeneration
      childContainer = @childContainers[i]
      next = =>
        if @childContainers[i + step]?
          @animateChildren generation, i + step, step, callback
        else
          callback?()
      if childContainer.hasClass("visible") == (step != 1) && @selectedIndex != i
        childContainer.show() if step == 1
        _.defer =>
          childContainer?.toggleClass "visible", step == 1 if @selectedIndex != i
          setTimeout =>
            _.defer => childContainer.hide() if step == -1 && @selectedIndex != i
            next()
          , 35
      else
        next()

module.exports = SecondMenuView