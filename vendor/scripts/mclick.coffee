(($) ->
  class MystandClick
    constructor: (el, handler) ->
      @handler = handler
      @el = $(el)

      isIOS = (/iphone|ipad/gi).test navigator.appVersion

      @el.bind "mousedown",   @onMouseDown
      @el.bind "mouseup",     @onMouseUp unless isIOS
      @el.bind "touchstart",  @onTouchStart
      @el.bind "touchend",    @onTouchEnd
      @el.bind "click",       @clickPrevent

    onMouseDown: (e) =>
      @onEventStart e
      yes

    onMouseUp: (e) =>
      @onEventEnd e
      yes

    onTouchStart: (e) =>
      @onEventStart(e) if e.originalEvent.touches.length == 1
      yes

    onTouchEnd: (e) =>
      @onEventEnd(e) if (e.originalEvent.touches.length == 0) && (e.originalEvent.changedTouches.length == 1)
      yes

    onEventStart: (e) =>
      @ready = yes
      @scrolled = no
      @iScroll = ($(p).data("iscroll") for p in @el.parents() when $(p).data("iscroll"))[0]
      if @iScroll
        @iScroll.mclickBindings = [] unless @iScroll.mclickBindings
        unless @ in @iScroll.mclickBindings
          @iScroll.on "scrollStart",  (e) => @scrolled = yes
          @iScroll.on "scrollEnd",    (e) => @scrolled = no
          @iScroll.mclickBindings.push @

    onEventEnd: (e) =>
      @handler?(e) if @ready and !@scrolled
      @ready = no

    clickPrevent: =>
      no

    unbind: =>
      @el.unbind "mousedown",   @onMouseDown
      @el.unbind "mouseup",     @onMouseUp
      @el.unbind "touchstart",  @onTouchStart
      @el.unbind "touchend",    @onTouchEnd
      @el.unbind "click",       @clickPrevent

  $.fn.extend
    mclick: (handler) ->
      @each (i, el) ->
        $(el).bind "mclick", handler

  $.event.special.mclick =
    setup: ->
    teardown: ->
    add: (data) ->
      $(@).data "mclick", new MystandClick @, data.handler
    remove: ->
      mclick = $(@).data("mclick")
      mclick?.unbind?()
      $(@).data "mclick", null
)(jQuery)