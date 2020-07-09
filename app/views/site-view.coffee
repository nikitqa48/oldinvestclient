View                  = require "views/view"
template              = require "views/templates/site"
ParticipateView       = require "views/participate-view"
InfraLayersView       = require "views/filters/infra-layers-view"
NaturalResourcesView  = require "views/filters/natural-resources-view"
nextAnimationEnd      = require "lib/next-animation-end"
nextTransitionEnd     = require "lib/next-transition-end"
SearchView = require "views/search-view"

class SiteView extends View
  container: "body"
  id: "site"
  template: template
  containerMethod: 'append'
  regions:
    "map":                "#map-container"
    "card":               "#card-container"
    "splash":             "#splash-container"
    "header":             "#header-container"
    "footer":             "#footer-container"
    "main-menu":          "#main-menu-container"
    "items-list":         "#items-list-container"
    "modal":              "#modal-container"
    "info-layers":        "#info-layers-container"
    "natural-resources":  "#natural-resources-container"
    "presentation":       "#presentation-container"
    search: "#search-container"

  afterRender: =>
    @subview "search", new SearchView
    @subview "info-layers", new InfraLayersView
      model: window.infraRaker.getFilter "infraLayer"

    @subview "natural-resources", new NaturalResourcesView
      model: window.naturalResourcesRaker.getFilter()

    Chaplin.mediator.subscribe "site:state", (state, v = yes) =>
      @.$el.toggleClass state, v
    Chaplin.mediator.publish "site:state", "blur"

    if window.isIOS then _.defer => @iOSfix()

  iOSfix: =>
    window.deviceWidth = ($(document).width() / 2).toFixed(0)
    window.deviceHeight = ($(document).height() / 2).toFixed(0)

module.exports = SiteView