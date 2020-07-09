
FilterFactory = require "factories/filter-factory"
Raker = require "collections/raker"

class RakerFactory
  build: (arr, data, key) =>
    new Raker data, (FilterFactory.build(obj, data) for obj in arr), key: key

  buildSearch: =>
    new Raker window.data.full, [FilterFactory.search()], key: "search"

  buildInfra: =>
    new Raker window.data.infrastructure, [FilterFactory.infraLayers()], key: "infrastructure"

  buildNaturalResourcesRaker: =>
    new Raker window.data.naturalResources, [FilterFactory.naturalResources()], key: "naturalResources"

module.exports = new RakerFactory