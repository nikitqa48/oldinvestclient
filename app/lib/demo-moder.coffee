Mediator = require 'mediator'

class DemoModer
  constructor: ->
    @ticks = 0
    @maxTicks = config.demoMode.startDelay
    @interval = config.demoMode.interval
    @autoStart = config.demoMode.autoStart
    @enable = false
    @demoObjects = window.data.demoObjects
    @maxNumber = @demoObjects.length - 1

    $('body').bind 'mousedown', @stop
    $('body').bind 'touchstart', @stop
    $(window).bind 'map:click', @stop
    @tick() if @maxNumber != 0 && @autoStart

  tick: =>
    @ticks = (@ticks || 0) + 1
    if @enable
      if @ticks >= @maxTicks
        @ticks = @maxTicks - @interval
        @changeCard()
      setTimeout @tick, 1000

  stop: (e) =>
    return false if e && $(e.target).hasClass('demo-mode-btn')
    @enable = false
    @ticks = 0
    Mediator.publish 'demo:stop'

  changeCard: =>
    random = parseInt(Math.random() * (@maxNumber + 1))
    Mediator.publish '!router:route', routeFor('items', @demoObjects[random])

  start: =>
    @enable = true
    @ticks = @maxTicks
    @tick()
    Mediator.publish 'demo:start'

  isEnable: =>
    @enable

singletone = new DemoModer() if config.demoMode
module.exports = singletone