View = require "views/view"
template = require "views/templates/designation"

class DesignationView extends View
  autoRender: true
  id: "designation"
  template: template
  region: "designation"

  afterRender: =>
    @designationList = @$ ".designation-list"
    @designationList.iScroll 
      scrollX: true
      scrollY: false
    
    $(window).load =>
      $(window).trigger "iscroll-refresh"

  getTemplateData: =>
    _.extend super,
      items: _(data.directories.naturalResourceTypes.models)

module.exports = DesignationView