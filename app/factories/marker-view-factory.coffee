MarkerViews =

  # Information markers views
  POI:                            require "views/markers/poi-marker-view"
  Idea:                           require "views/markers/idea-marker-view"
  City:                           require "views/markers/city-marker-view"
  Company:                        require "views/markers/company-marker-view"
  Project:                        require "views/markers/project-marker-view"
  DevelopmentPlan:                require "views/markers/development-plan-marker-view"
  Platform:                       require "views/markers/platform-marker-view"
  Municipality:                   require "views/markers/municipality-marker-view"
  IndustrialPark:                 require "views/markers/industrial-park-marker-view"
  NaturalResource:                require "views/markers/natural-resource-marker-view"
  CulturalHeritage:               require "views/markers/cultural-heritage-marker-view"
  SpecialEconomicZone:            require "views/markers/special-economic-zone-marker-view"
  Cluster:                        require "views/markers/cluster-marker-view"
  infrastructuralObject:          require "views/markers/infrastructural-object-marker-view"
  TerritorialDevelopmentArea:     require "views/markers/territorial-development-area-marker-view"

  # Infrastructure markers views
  Sewer:                          require 'views/markers/infrastructure/sewer-view'
  Intake:                         require 'views/markers/infrastructure/intake-view'
  WindPlant:                      require 'views/markers/infrastructure/wind-plant-view'
  HydroPlant:                     require 'views/markers/infrastructure/hydro-plant-view'
  WaterSupply:                    require 'views/markers/infrastructure/water-supply-view'
  GasPipeline:                    require 'views/markers/infrastructure/gas-pipeline-view'
  HeatingMain:                    require 'views/markers/infrastructure/heating-main-view'
  DieselPowerPlant:               require 'views/markers/infrastructure/diesel-power-plant-view'
  DuelFuelPowerPlant:             require 'views/markers/infrastructure/duel-fuel-power-plant-view' 
  CentralHeatingUnit:             require 'views/markers/infrastructure/central-heating-unit-view'
  HeatOnlyBoilerStation:          require 'views/markers/infrastructure/heat-only-boiler-station-view'
  TransformerSubstation:          require 'views/markers/infrastructure/transformer-substation-view'
  GasDistributionStation:         require 'views/markers/infrastructure/gas-distribution-station-view'
  WastewaterTreatmentPlant:       require 'views/markers/infrastructure/wastewater-treatment-plant-view'
  ElectricPowerTransmission:      require 'views/markers/infrastructure/electric-power-transmission-view'
  GeothermalElectricityPlant:     require 'views/markers/infrastructure/geothermal-electricity-plant-view'
  
  # TODO: cleanup
  GasMain:                        require 'views/markers/infrastructure/gas-main-view'
  GasStationExisting:             require 'views/markers/infrastructure/gas-station-existing-view'
  GasConsumerExisting:            require 'views/markers/infrastructure/gas-consumer-existing-view'
  GasConsumerPerspective:         require 'views/markers/infrastructure/gas-consumer-perspective-view'
  GasSettlementExisting:          require 'views/markers/infrastructure/gas-settlement-existing-view'
  GasSettlementPerspective:       require 'views/markers/infrastructure/gas-settlement-perspective-view'
  GasStationPerspective:          require 'views/markers/infrastructure/gas-station-perspective-view'
  ElectricPowerTransmission:      require 'views/markers/infrastructure/electric-power-transmission-view'
  TransformerStation:             require 'views/markers/infrastructure/transformer-station-view'  
  ReducingGasDistributionStation: require 'views/markers/infrastructure/reducing-gas-distribution-station-view'
  
class MarkerViewFactory
  cache: {}

  get: (object) =>
    className = object.className()
    cacheKey = className + object.id
    markerView = @cache[cacheKey]
    unless markerView
      markerViewClass = MarkerViews[className]
      markerView = @cache[cacheKey] = new markerViewClass model: object if markerViewClass
    markerView

module.exports = new MarkerViewFactory