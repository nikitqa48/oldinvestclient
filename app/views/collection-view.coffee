class CollectionView extends Chaplin.CollectionView
  initialize: ->
    # TODO: wtf is this? Causes TypeError: 'undefined' is not an object (evaluating 'proto[property]') in Chaplin.js
    # _(this).bindAll()

  # Precompiled templates function initializer.
  getTemplateFunction: =>
    @template

  getTemplateData: =>
    _: _
    t: window.t
    model: @model
    collection: @collection
    config: window.config
    options: @options

  beforeRender: ->

  render: ->
    @beforeRender()
    super
    @afterRender()

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

  open: =>
    @$el.addClass "opened" 

  close: =>
    @$el.addClass "opened"

#  renderAllItems: ->
#    super
#
#  renderItem: ->
#    super
#  insertView: (item, view, position, enableAnimation = true) ->
#    super

module.exports = CollectionView