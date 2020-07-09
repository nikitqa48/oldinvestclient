View = require "views/view"
InfraLayersView = require "views/filters/infra-layers-view"
ParticipateView = require "views/participate-view"
template = require "views/templates/header"
Mediator  = require "mediator"

class HeaderView extends View
  autoRender: true
  template: template
  className: "header"
  region: "header"

  afterRender: =>
    @$(".participate-btn").bind "mclick", => new ParticipateView

    @infraLayersBtn = @$ ".info-layers-btn"
    @infraLayersBtn.bind "mclick", =>
      Mediator.publish "toggleInfraLayers"

    @naturalResourcesBtn = @$ ".natural-resources-btn"
    @naturalResourcesBtn.bind "mclick", => Mediator.publish "toggleNaturalResources"

module.exports = HeaderView
