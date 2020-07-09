BadBrowser =
  check: () ->
    if($.browser.msie && $.browser.version<9)
      @.redirect()

    if($.browser.opera && $.browser.version<11)
      @.redirect()

    if($.browser.mozilla && $.browser.version<3.6)
      @.redirect()

  redirect: () ->
    window.location = "/badbrowser.html"

module.exports = BadBrowser
