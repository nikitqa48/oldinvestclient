View = require "views/view"
template = require "views/templates/card-data"
RenderDataHelper = require("lib/render-data-helper")

class CardDataView extends View
  autoRender: yes
  className: "cardData"
  template: template
  region: "cardData"

  getTemplateData: =>
    _.extend super,
      renderTable: new RenderDataHelper(@model, config.excludedFields).renderTable()

module.exports = CardDataView