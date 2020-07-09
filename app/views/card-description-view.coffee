View = require "views/view"
template = require "views/templates/card-description"

class CardDescriptionView extends View
  autoRender: yes
  className: 'cardDescription'
  template: template
  region: 'cardDescription'

module.exports = CardDescriptionView
