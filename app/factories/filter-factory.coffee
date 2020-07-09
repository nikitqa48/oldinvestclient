FilterFactory =
  build: (obj, data) ->
    type = obj.type
    filterName = _.str.dasherize type
    filterClass = require "models/filters/#{filterName}-filter"
    if filterClass
      delete obj[type]
      new filterClass obj, data
  search: () ->
    SearchFilter = require "models/filters/search-filter"
    new SearchFilter

  infraLayers: ()->
    InfraLayers = require "models/filters/infra-layers-filter"
    new InfraLayers

  naturalResources: () ->
    ChoiceFilter = require 'models/filters/choice-filter'
    new ChoiceFilter
      multiple: no
      allowBlank: no
      foreignKey: "code"
      matchedTypes: ["NaturalResource"]
      field: "natural_resource_type"
      items: data.directories.naturalResourceTypes

module.exports = FilterFactory