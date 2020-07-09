View = require "views/view"
ItemView = require "views/item-view"
Mediator = require "mediator"
template = require "views/templates/items-list"
PatchLinks = require "lib/patch-links"
Collection = require "collections/collection"

class ItemsListView extends View
  autoRender: true
  id: "items-list"
  template: template
  region: "items-list"
  dontPatchLinks: yes

  initialize: (options = {}) =>
    super options
    @rakers = []
    @itemViewsCache = {}
    Mediator.subscribe "raker:set", @open
    Mediator.subscribe "raker:unset", @close
    Mediator.subscribe "raker:unset", @close
    Mediator.subscribe "items-list:hide", @hide

    @data = new Collection
    @data.comparator = "created_at"
    @data.bind "add", @addItem
    @data.bind "remove", @removeItem

  afterRender: =>
    @itemsStack = []

    @listContainer = @$ "ul"
    @counter = @$ ".counter .count"

    @sortContainer =  @$ ".sort-container"
    @sortButton =  @$ ".sort-container .sort-button"
    @sortButton.bind "mclick", @toggleSort

    @scrollContainer = @$ ".scroll-container"
    @scrollContainer.iScroll {}, (@iScroll) =>
    @regionContainer = $ "#items-list-container"
    @nothingLabel = @$ "li.nothing"

    @iScrollRefresh = _.debounce =>
      @iScroll.refresh()
    , 300
    @showSortContainer = _.throttle () => 
      @sortContainer.show()
    , 300
    @hideSortContainer = _.throttle () => 
      @sortContainer.hide()
    , 300

  open: (key, raker, callback) =>
    if key is "main" and raker != window.defaultRaker
      unless @raker is raker
        if @raker
          @raker.data.unbind "add", @addObject
          @raker.data.unbind "remove", @removeObject
        @$el.removeClass "raker-#{@raker.key}" if @raker?.key?
        @raker = raker
        if @raker
          @raker.data.bind "add", @addObject
          @raker.data.bind "remove", @removeObject
          @data.set @raker.data.models
          @$el.addClass "raker-#{@raker.key}"
      @$el.show()
    @$el.fadeIn 100, => callback?()

  close: (key, raker, callback) =>
    return unless key == "main"
    if @raker
      @raker.data.unbind "add", @addObject
      @raker.data.unbind "remove", @removeObject
      cssClassToRemove = "raker-#{@raker.key}"
    @raker = null
    @$el.fadeOut 100, =>
      @$el.removeClass cssClassToRemove
      @data.reset()
      @listContainer.html ''
      @sortContainer.hide()
      callback?()

  hide: =>
    @$el.hide()

  addObject: (object) =>
    @data.add object

  removeObject: (object) =>
    @data.remove object

  addItem: (item) =>
    @itemsStack.push ['showItem', item]
    @startRender()

  removeItem: (item) =>
    @itemsStack.push ['hideItem', item]
    @startRender()

  startRender: =>
    @iScrollRefresh()
    @renderStep() unless @renderId

  renderStep: =>
    [action, item] = stackItem if stackItem = @itemsStack.pop()
    if item
      @[action] item
      @renderId = setTimeout @renderStep, 0
    else
      @renderId = null
      @iScrollRefresh()

  showItem: (item) =>
    if @data.include item
      @itemViewsCache[item] = new ItemView model: item unless @itemViewsCache[item]
      itemView = @itemViewsCache[item]
      @listContainer.append itemView.el unless itemView.inDom()
      itemView.$el.addClass 'visible'
      @showSortContainer() if @data.length > 0

  hideItem: (item) =>
    unless @data.include item
      @itemViewsCache[item]?.$el?.removeClass 'visible'
      @hideSortContainer() if @data.length == 0 

  toggleSort: (ev) =>
    target = $ ev.currentTarget
    field = target.data "field"
    order = target.data "order"
    if order == "asc"
      order = true
      target.data "order", "desc"
      target.attr "data-order", "desc"
    else
      order = false
      target.data "order", "asc"
      target.attr "data-order", "asc"
    @sort field, order
    @rerender()
    @sortButton.removeClass "active"
    target.addClass "active"

  rerender: =>
    @listContainer.html ''
    @data.map (item) => @addItem item

  sort: (field, isAscending = true) =>
    @data.comparator = field
    @data.sort()
    if isAscending
      @data.models.reverse()

module.exports = ItemsListView