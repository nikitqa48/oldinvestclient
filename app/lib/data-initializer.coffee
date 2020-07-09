Collection      = require 'collections/collection'
PageFragments   = require 'collections/page-fragments'

DataInitializer =
  parse: (data) ->
    res =
      directories: @directories data
      infrastructures: @infrastructures data
      naturalResources: @naturalResources data

    window.data = res

    # Set base layers
    baseLayers = ["projects",
                  "platforms",
                  "municipalities",
                  "ideas",
                  "special_economic_zones",
                  "industrial_parks",
                  "development_plans"
                  "companies", "clusters", "cities"]

    # Build base layers collections
    for layer in baseLayers
      res[layer] = @collectionBuilder(data, layer)

    res.full = _(res[layer].models for layer in baseLayers).flatten()
    res.infrastructure = []

    for layer of res.infrastructures
      for obj in res.infrastructures[layer].models
        _(res.infrastructure).push obj

    res.all = _.union(res.full, res.infrastructure, res.naturalResources)

    demoProjects = res.projects.filter (item) ->
      item.get "demo_mode"
    demoPlatforms = res.platforms.filter (item) ->
      item.get "demo_mode"
    demoSEZ = res.special_economic_zones.filter (item) ->
      item.get "demo_mode"
    demoCity = res.cities.filter (item) ->
      item.get "demo_mode"
    demoMunicipality = res.municipalities.filter (item) ->
      item.get "demo_mode"
    res.demoObjects = _.union demoProjects, demoPlatforms, demoCity, demoMunicipality
    , demoSEZ
    res.pageFragments = new PageFragments(data.page_fragments)

    res

  # Build collection from "collections/name"
  collectionBuilder: (data, name) ->
    collection = require "collections/#{_(name).dasherize()}"
    new collection data[name]

  directories: (data) ->
    DirectoryItems        = require("collections/directory-items")
    NaturalResourceTypes  = require("collections/natural-resource-types")

    naturalResourceTypes:     new NaturalResourceTypes(data.directories.natural_resource_types)
    projectKinds:             new DirectoryItems(data.directories.project_kinds)
    projectTypes:             new DirectoryItems(data.directories.project_types)
    stages:                   new DirectoryItems(data.directories.stages)
    ownershipTypes:           new DirectoryItems(data.directories.ownership_types)
    infrastructureTypes:      new DirectoryItems(data.directories.infrastructure_types)
    landCategories:           new DirectoryItems(data.directories.land_categories)
    supportTypes:             new DirectoryItems(data.directories.support_types)
    rightForms:               new DirectoryItems(data.directories.right_forms)
    activitySpheres:          new DirectoryItems(data.directories.activity_spheres)
    terms:                    new DirectoryItems(data.directories.terms)
    platformTypes:            new DirectoryItems(data.directories.platform_types)
    gicNumbers:               new DirectoryItems(data.directories.gic_numbers)
    investors:                new DirectoryItems(data.directories.investors)
    territoryTypes:           new DirectoryItems(data.directories.territory_types)
    territories:              new DirectoryItems(data.directories.territories)
    economicActivities:       new DirectoryItems(data.directories.economic_activities)
    developmentPlanTypes:     new DirectoryItems(data.directories.development_plan_types)
    specialEconomicZoneTypes: new DirectoryItems(data.directories.special_economic_zone_types)


  infrastructures: (data) ->
    objects = {}
    for layer of data.infrastructures
      try
        objects[layer] = @collectionBuilder(data.infrastructures, layer)
    objects

  naturalResources: (data) ->
    models = data.natural_resources
    NaturalResourcesCollection = require 'collections/natural-resources'
    naturalResourcesCollection = new NaturalResourcesCollection models
    naturalResourcesCollection.models

module.exports = DataInitializer