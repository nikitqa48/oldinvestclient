View = require "views/view"
PatchLinks = require "lib/patch-links"

class ItemView extends View
  autoRender: true
  className: "item"
  tagName: "li"

  getTemplateData: =>
    if @model.className() == "Platform"
      fields = ["electricity", "water", "gas", "heating", "sewerage", "sewage_plants", "boiler_system"]
      infra_objects = _.pick(@model.attributes, fields)
      _.extend super,
        infra_objects: infra_objects
    else
      super

  render: =>
    @beforeRender()
    modelClassName = @model.className()
    fileName = _(modelClassName).dasherize().substr 1
    base = "views/templates/items"
    way = "#{base}/#{fileName}"
    defaultWay = "#{base}/item"
    template = try
      require way
    catch _error
      require defaultWay

    @$el.html template(@getTemplateData())
    @afterRender()
    @

  afterRender: =>
    PatchLinks.initialize @$("a")

module.exports = ItemView