Mediator 			= require "mediator"
Presentation 	= require "presentations/base/presentation"

module.exports = class AboutPresentation extends Presentation
  render: () =>
    setTimeout =>
      container = $ ".about-wrap"
      container.iScroll()
      closeBtn = $(".about-wrap .close-card")
      closeBtn.bind "mclick", =>
        Mediator.publish "presentation:menu:close", "about"
    , 250