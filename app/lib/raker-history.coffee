Mediator = require "mediator"

class RakerHistory
  constructor: ->
    @history = {}
    @currentRakers = {}

    Mediator.subscribe "raker:set", @set
    Mediator.subscribe "raker:unset", (key) => @set key, null
    Mediator.subscribe "raker:store", @store
    Mediator.subscribe "raker:restore", @restore

  set: (key, raker) =>
    @currentRakers[key] = raker

  store: (key) =>
    @history[key] = [] unless @history[key]?
    @history[key].push @currentRakers[key]

  restore: (key) =>
    raker = @history[key]?.pop?()
    Mediator.publish "raker:unset", key
    _.defer ->
      Mediator.publish "raker:set", key, raker

module.exports = new RakerHistory