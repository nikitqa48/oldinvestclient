#require modernizr

class NextAnimationEnd
  constructor: (el, handler, args...)->
    @args = args
    @handler = handler
    @el = $ el
    if Modernizr.csstransitions
      @events = "webkitAnimationEnd oanimationend msAnimationEnd animationend"
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
    nextAnimationEnd: (handler, args...)->
      new NextAnimationEnd @, handler, args...
      @
)(jQuery)

nextAnimationEnd = (el, handler, args...)->
  new NextAnimationEnd el, handler, args...

module.exports = nextAnimationEnd