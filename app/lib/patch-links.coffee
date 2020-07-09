PatchLinks =
  initialize: (dom)->
    for element, index in $(dom).not(".no-patch")
      $(element).bind "mclick", (e) ->
        url = $(e.currentTarget).attr("href")
        if url
          if url.indexOf("http://") != 0
            jsKeyWord = "javascript:";
            if url.indexOf(jsKeyWord) == 0
              eval(url.substr(jsKeyWord.length))
            else
              url = url[1..] if url[0] == "#"
              Chaplin.mediator.publish "!router:route", url
          else
            window.location = url
        no

module.exports = PatchLinks