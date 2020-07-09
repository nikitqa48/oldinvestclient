i18n                = require 'lib/i18n'
Raker               = require 'collections/raker'
routes              = require 'routes'
config              = require 'config/config'
Mediator            = require 'mediator'
Collection          = require 'collections/collection'
DataLoader          = require 'lib/data-loader'
RakerFactory        = require 'factories/raker-factory'
DataInitializer     = require 'lib/data-initializer'
window.rakerHistory = require 'lib/raker-history'

module.exports = class Application extends Chaplin.Application
  initialize: (options = {}) ->
    if @started then throw new error "Application#initialize: App was already started"

    # Translate titles
    document.title = t('titles.sitename') + ' ' + t('titles.region')
    $("#splashscreen-name-phrase").attr 'src', "./images/splashscreen-name-bolder-" + i18n.locale + ".png"
      
    DataLoader.load (source) =>
      data = DataInitializer.parse source

      window.defaultRaker               = RakerFactory.build [], data.full, key: "default"
      window.infraRaker                 = RakerFactory.buildInfra()
      window.municipalitiesRaker        = RakerFactory.build [], data.municipalities, key: "municipalities"
      window.naturalResourcesRaker      = RakerFactory.buildNaturalResourcesRaker()
      window.citiesRaker                = RakerFactory.build [], data.cities, key: "cities"
      window.specialEconomicZonesRaker  = RakerFactory.build [], data.special_economic_zones, key: "special_economic_zones"
      window.searchRaker                = RakerFactory.buildSearch()

      setTimeout ->
        $("#splashscreen-container").addClass "turn"
      , 2000

      super options