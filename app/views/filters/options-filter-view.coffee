View        = require 'views/view'
template    = require 'views/templates/filters/options-filter'
Collection  = require 'collections/collection'

module.exports = class OptionsFilterView extends View
  className: "filter options-filter closed virgin"
  template: template

  getTemplateData: =>
    _.extend super,
      items: _(@model.itemsData())
      selected: @model.get "selected"
      model: @model

  afterRender: =>
    items = @$ "li"
    items.bind "mclick", @toggle

  toggle: (ev) =>
    target = $ ev.currentTarget
    key = target.data "key"

    item = @model.getItem key
    @model.toggle item

    $(target).toggleClass "checked"
    $(window).trigger "iscroll-refresh"

    # @body = $ "body"
    # @body.bind "click", @close
    # @titleContainer = @$ ".filter-title-container, .tooltip"
    # @selectedItemsContainer = @$ "ul.selected-items"
    # @scrollContainer = @$ ".scroll-container"
    # @scrollContainer.iScroll {}, (@iScroll) =>

    # @itemsList = $ "li", @scrollContainer
    # @itemsList.bind "mclick", @toggleItem
    # @titleContainer.bind "mclick", @expand
    # @model.bind "change", @refreshCheckboxList

  # toggleItem: (ev) =>
  #   el = $ ev.currentTarget
  #   el.toggleClass "selected"
  #   item = @getModelItem el
  #   @model.toggle item

  # getModelItem: (item) =>
  #   @model.getItem $(item).data "key"

  # refreshCheckboxList: =>
  #   for item in @itemsList
  #     $(item).toggleClass "selected", @model.isSelected(@getModelItem(item))

  # drawSelectedItems: =>
  #   @selectedItemsContainer.empty()
  #   items = @model.get "selected"
  #   items.each (item) =>
  #     name = $("<span>").html item.get("name")
  #     cancel = $("<div>").addClass "cancel-button"
  #     li = $("<li>").data("key", item.get(@model.foreignKey())).append(name).append cancel
  #     li.appendTo @selectedItemsContainer
  #     li.bind "mclick", @dropItem
  #     @virginityTest()

  # virginityTest: =>
  #   items = @model.get "selected"
  #   @$el.toggleClass "virgin", items.isEmpty()

  # dropItem: (ev)=>
  #   target = $ ev.currentTarget
  #   id = target.data "key"
  #   @model.toggle id
  #   target.slideUp
  #     easing: "linear"
  #     duration: 100
  #     complete: @virginityTest

  # close: (e) =>
  #   needToClose = !@$el.hasClass("closed") && e.target != @el && $.inArray(@el, $(e.target).parents()) == -1
  #   if needToClose
  #     @expand()

  # expand: =>
  #   closed = @$el.hasClass "closed"
  #   if closed
  #     @$el.toggleClass "closed"
  #     setTimeout =>
  #       @scrollContainer.slideDown
  #         easing: "linear"
  #         duration: 100
  #         complete: =>
  #           $(window).trigger "iscroll-refresh"
  #     , 100
  #   else
  #     @drawSelectedItems()
  #     @virginityTest()
  #     @scrollContainer.slideUp
  #       easing: "linear"
  #       duration: 100
  #       complete: =>
  #         @$el.toggleClass "closed"