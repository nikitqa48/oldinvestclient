#require modernizr

class NextTransitionEnd
  constructor: (el, handler, args...)->
    @args = args
    @handler = handler
    @el = $ el
    if Modernizr.csstransitions
      @events = "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"
      @el.bind @events, @callback
    else
      @handler @args

  callback: =>
    @handler @args...
    @unbind()

  unbind: =>
    @el.unbind @events, @callback

(($)->
  $.fn.extend
    nextTransitionEnd: (handler, args...)->
      new NextTransitionEnd @, handler, args...
      @
)(jQuery)

nextTransitionEnd = (el, handler, args...)->
  new NextTransitionEnd el, handler, args...

module.exports = nextTransitionEnd