View      = require "views/view"
Mediator  = require "mediator"
template  = require "views/templates/filters/infra-layers"

class InfraLayersView extends View
  template: template
  id: "info-layers"
  region: "info-layers"
  autoRender: yes

  getTemplateData: =>
    _.extend super,
      infraLayers: data.infrastructures

  afterRender: =>
    @liArr = @$ "li"
    @liArr.bind "mclick", @toggleLayer
    if @model
      @model.bind "change", @updateView

#    @scrollContainer = @$ ".infrastructural-layers-container"
    @.$el.iScroll()

    Mediator.subscribe "toggleInfraLayers", @toggle

    $(window).bind "mousedown touchstart map:click", (ev) =>
      target = $ ev.target
      if (target[0] != @el) && target.parents("#info-layers-container").length == 0 && !target.hasClass("info-layers-btn") && target.parents(".info-layers-btn").length == 0
        @close()

  toggle: =>
    if @opened then @close() else @open()

  toggleLayer: (ev)=>
    target = $ ev.currentTarget
    value = target.data "value"
    @model.toggleSelection value

  updateView: =>
    @liArr.each (i, el)=>
      $(el).toggleClass "selected", @model.isSelected($(el).data("value"))

module.exports = InfraLayersView
