View      = require "views/view"
Mediator  = require "mediator"
template  = require "views/templates/filters/natural-resources"

module.exports = class NaturalResourcesView extends View
  template: template
  id: "natural-resources"
  region: "natural-resources"
  autoRender: yes

  getTemplateData: =>
    _.extend super,
      naturalResourcesTypes: data.directories.naturalResourceTypes

  afterRender: =>
    @liArr = @$ "li"
    @liArr.bind "mclick", @toggleLayer
    if @model
      @model.bind "change", @updateView

    @scrollContainer = @$ ".natural-resources-container"
    @scrollContainer.iScroll()

    Mediator.subscribe "toggleNaturalResources", @toggle

    $(window).bind "mousedown touchstart map:click", (ev) =>
      target = $ ev.target
      if (target[0] != @el) && target.parents("#natural-resources-container").length == 0 && !target.hasClass("natural-resources-btn") && target.parents(".natural-resources-btn").length == 0
        @close()

  toggle: =>
    if @opened then @close() else @open()

  toggleLayer: (ev)=>
    target = $ ev.currentTarget
    value = target.data "value"
    @model.toggle value

  updateView: =>
    @liArr.each (i, el)=>
      $(el).toggleClass "selected", @model.isSelected($(el).data("value"))