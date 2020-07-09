Mediator = require "mediator"

class BufferedMediator
  constructor: ->
    @buffer = {}

  publish: (key, args...) =>
    @buffer[key] = [] unless @buffer[key]
    @buffer[key].push args
    Mediator.publish.apply Mediator, arguments

  subscribe: (key, handler, context) =>
    publications = @buffer[key]
    if publications
      for publication in publications
        handler.apply context, publication
    Mediator.subscribe key, handler, context

module.exports = new BufferedMediator