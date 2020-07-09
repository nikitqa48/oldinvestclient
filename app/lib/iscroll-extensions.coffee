(($) ->
  $.fn.extend iScroll: (params, callback) ->
    defaultParams =
      wheelDeltaX: 25
      scrollbars: true
      mouseWheel: true
      interactiveScrollbars: true

    setTimeout =>
      $(@).each (i, el) ->
        if window.browser == "Explorer"
          $(el).css("overflow-y", "auto")
          $(el).css("overflow-x", "hidden")
          iScrollObject = {}
        else
          iScrollObject = new IScroll(el, _.extend(defaultParams, params))
          $(el).data "iscroll", iScrollObject
          $(window).bind "iscroll-refresh", ->
            iScrollObject.refresh()
          iScrollIndicator = $(".iScrollIndicator", el)
          iScrollIndicator.append "<div>"
        callback and callback(iScrollObject)

    , 0
    @) jQuery