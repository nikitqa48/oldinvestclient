Mediator = require "mediator"
config = require "config/config"
i18n = require "lib/i18n"

DataLoader = load: (handler, context) ->
  $.ajax
    url: config.dataUrl[i18n.locale]
    type: "GET"
    dataType: "jsonp"
    jsonpCallback: "dataLoaderCallback"
    crossDomain: true
    context: this
    success: (data) ->
      handler.apply context || this, [data]
      Mediator.publish "dataLoaded"

module.exports = DataLoader