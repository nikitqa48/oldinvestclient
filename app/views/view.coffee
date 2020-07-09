PatchLinks = require "lib/patch-links"
require "lib/view-helper"

class View extends Chaplin.View
  initialize: (options)->
    @options = options
    # TODO: wtf is this? Causes TypeError: 'undefined' is not an object (evaluating 'proto[property]') in Chaplin.js

  # Precompiled templates function initializer.
  getTemplateFunction: =>
    @template

  getTemplateData: =>
    _: _
    t: window.t
    model: @model
    collection: @collection
    config: window.config
    urlFor: window.urlFor
    routeFor: window.routeFor
    imageUrl: window.imageUrl
    options: @options
    templateData: window.data

  getRenderData: =>
    @getTemplateData()

  beforeRender: ->

  render: ->
    @beforeRender()
    res = super
    @afterRender() if res
    PatchLinks.initialize @$("a").not ".no-patch"
    res

  afterRender: -> 

  inDom: ->
    @$el.parent().length isnt 0

  instances: []

  getInstance: (options) ->
    instance = View.instances[@instanceId]
    unless instance
      instance = new this(options)
      @instanceId = View.instances.push(instance) - 1
    instance

  open: (callback) =>
    @$el.addClass "opened"
    @opened = yes
    callback?()

  close: (callback) =>
    @$el.removeClass "opened" if @$el
    @opened = no
    callback?()

  toggle: (callback) =>
    if @opened
      @close callback
    else
      @open callback

module.exports = View