View      = require 'views/view'
Mediator  = require "mediator"

module.exports = class PresentationView extends View
  className: "presentation-view"
  region: "presentation"
  autoRender: yes

  initialize: (data) =>
    @presentationName = data.key
    $(@el).addClass @presentationName
    @template = require "views/templates/presentations/#{@presentationName}"

#    Mediator.publish "raker:store", "main"
#    Mediator.publish "raker:unset", "main"
    super

  afterRender: =>
    basePresentationPath = "presentations/base/presentation"
    presentationPath = "presentations/#{@presentationName}-presentation"

    Presentation = try
      require presentationPath
    catch
      require basePresentationPath

    @presentation = new Presentation @el
    @$el.iScroll()
    setTimeout =>
      $(window).trigger("iscroll-refresh")
    , 0

  open: (callback) =>
    Mediator.publish "raker:store", "main"
    Mediator.publish "raker:unset", "main"
    super callback


  close: (callback) =>
    super
    @presentation.reset()
    Mediator.publish "presentation:stop"
    setTimeout =>
      @dispose()
    , 200
#    Mediator.publish "raker:restore", "main"