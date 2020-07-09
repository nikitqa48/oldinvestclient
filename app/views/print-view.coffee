View = require "views/view"
template = require "views/templates/print"
ValueFactory = require "factories/value-factory"
CardDataView = require "views/card-data-view"
CardDescriptionView = require "views/card-description-view"

class PrintView extends View
  autoRender: no
  className: "card"
  template: template
  regions:
    cardData: "#card-data-container"
    cardDescription: "#card-description-container"

  getTemplateData: =>
    modelClassName = @model.className()
    fileName = _(modelClassName).dasherize().substr 1
    way = "views/templates/card/print"
    defaultWay = "views/templates/card/default"
    partial = try
      require way
    catch
    require
    defaultWay

    _.extend super,
      renderPartial: partial
      parseMoney: $.proxy ValueFactory.build, ValueFactory


  afterRender: =>
    @subview "data", new CardDataView model: @model
    if @model.get('description')
      @subview "description", new CardDescriptionView model: @model


module.exports = PrintView