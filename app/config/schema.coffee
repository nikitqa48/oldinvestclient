SpecialEconomicZoneFilters = [
    type: "range"
    title: t("special_economic_zones.attributes.free_square")
    matchedTypes: ["SpecialEconomicZone"]
    field: "free_square"
    values: "million"
    currency: "sq_m"
  ,
    type: "choice"
    title: t("special_economic_zones.attributes.municipality_id")
    field: "municipality"
    matchedTypes: ["SpecialEconomicZone"]
    foreignKey: "id"
    items: data.municipalities
    tooltip: t("special_economic_zones.attributes.municipality_tooltip")
  ,
    type: "choice"
    title: t("special_economic_zones.attributes.special_economic_zone_type_code")
    field: "special_economic_zone_type"
    matchedTypes: ["SpecialEconomicZone"]
    foreignKey: "code"
    items: data.directories.specialEconomicZoneTypes
    tooltip: t("special_economic_zones.attributes.special_economic_zone_type_tooltip")
]

IndustrialParksFilters = [
    type: "range"
    title: t("industrial_parks.attributes.free_square")
    matchedTypes: ["IndustrialPark"]
    field: "free_square"
    values: "million"
    currency: "sq_m"
  ,
    type: "choice"
    title: t("industrial_parks.attributes.municipality_id")
    field: "municipality"
    matchedTypes: ["IndustrialPark"]
    foreignKey: "id"
    items: data.municipalities
    tooltip: t("industrial_parks.attributes.municipality_tooltip")
]

ProjectFilters = [
    type: "range"
    title: t("projects.attributes.common_price")
    field: "common_price"
    values: "million"
    currency: "rub"
    matchedTypes: ["Project"]
  ,
    type: "range"
    title: t("projects.attributes.required_investments")
    field: "required_investments"
    values: "million"
    currency: "rub"
    matchedTypes: ["Project"]
  ,
    type: "choice"
    title: t("projects.attributes.municipality_id")
    field: "municipality"
    matchedTypes: ["Project"]
    foreignKey: "id"
    items: data.municipalities
    tooltip: t("projects.attributes.municipality_tooltip")

  ]

##########################################################################################################

PlatformFilters = [
    type: "choice"
    title: t("platforms.attributes.ownership_type_code")
    field: "ownership_type"
    items: data.directories.ownershipTypes
    tooltip: t("platforms.attributes.ownership_type_tooltip")
  ,
    type: "choice"
    title: t("platforms.attributes.land_category_code")
    field: "land_category_code"
    items: data.directories.landCategories
    tooltip: t("platforms.attributes.land_category_tooltip")
  ,
    type: "boolean"
    title: t("platforms.attributes.gas")
    field: "gas"
  ,
    type: "boolean"
    title: t("platforms.attributes.electricity")
    field: "electricity"
  ,
    type: "boolean"
    title: t("platforms.attributes.heating")
    field: "heating"
  ,
    type: "boolean"
    title: t("platforms.attributes.water")
    field: "water"
  ,
    type: "boolean"
    title: t("platforms.attributes.sewerage")
    field: "sewerage"
  ,
    type: "boolean"
    title: t("platforms.attributes.sewage_plants")
    field: "sewage_plants"
  ,
    type: "boolean"
    title: t("platforms.attributes.boiler_system")
    field: "boiler_system"
  ,
    type: "range"
    title: t("platforms.attributes.road_distance")
    field: "road_distance"
    currency: "km"
  ,
    type: "range"
    title: t("platforms.attributes.city_distance")
    field: "city_distance"
    currency: "km"
  ]

##########################################################################################################

Schema = [
  key: "region"
  image: "../images/about-region-icon.png"
  children: [
    key: "about"
    title: "Общая информация"
    collections: []
  ,
    key: "development_plans"
    title: "План развития инфраструктуры"
    collections: ["development_plans"]
    filters: [
      type: "options"
      title: t("development_plans.attributes.development_plan_type")
      field: "development_plan_type"
      foreignKey: "code"
      matchedTypes: ["DevelopmentPlan"]
      items: data.directories.developmentPlanTypes
      tooltip: t("development_plans.attributes.development_plan_type_tooltip")
    ]
  ,
    key: "population"
    title: "Численность населения"
    collections: ["municipalities", "cities"]
  ,
    key: "density"
    title: "Плотность населения"
    collections: ["municipalities", "cities"]
  ,
    key: "climate"
    title: "Климатические условия"
    collections: []
  ]
,
  key: "projects"
  image: "../images/main-project-icon.png"
  children: [
    key: "done"
    title: "Реализованные"
    collections: ["projects"]
    filter: (o) -> try o.projectType().get("code") == 1
    filters: ProjectFilters
  ,
    key: "need_money"
    title: "Реализуемые"
    collections: ["projects"]
    filter: (o) -> try o.projectType().get("code") == 2
    filters: ProjectFilters
  ,
    key: "planned"
    title: "Планируемые"
    collections: ["projects"]
    filter: (o) -> try o.projectType().get("code") == 0
    filters: ProjectFilters
  ]
,
  key: "platforms"
  image: "../images/platforms.svg"
  children: [
    key: "special_economic_zones"
    title: "Особые экономические зоны"
    collections: ["special_economic_zones"]
    filters: SpecialEconomicZoneFilters
  ,
    key: "industrial_parks"
    title: "Индустриальные парки"
    collections: ["industrial_parks"]
    filters: IndustrialParksFilters
  ,
    key: "clusters"
    title: "Кластеры"
    collections: ["clusters"]
    filters: [
      type: "range"
      title: t("clusters.attributes.free_square")
      matchedTypes: ["Cluster"]
      field: "free_square"
      values: "million"
      currency: "sq_m"
    ,
      type: "choice"
      title: t("clusters.attributes.municipality_id")
      field: "municipality"
      matchedTypes: ["Cluster"]
      foreignKey: "id"
      items: data.municipalities
      tooltip: t("clusters.attributes.municipality_tooltip")
    ]
  ,
    key: "for_industry"
    title: "Земли для промышленности"
    collections: ["platforms"]
    filter: (o) -> try o.landCategory().get("code") == 2
    filters: PlatformFilters
  ,
    key: "for_agriculture"
    title: "Земли для сельского хозяйства"
    collections: ["platforms"]
    filter: (o) -> try o.landCategory().get("code") == 0
    filters: PlatformFilters
  ,
    key: "natural_heritage"
    title: "Природное достояние"
    collections: ["platforms"]
    filter: (o) -> try o.landCategory().get("code") in [3, 4, 5]
    filters: PlatformFilters
  ,
    key: "building"
    title: "Земли под жилую застройку"
    collections: ["platforms"]
    filter: (o) -> try o.landCategory().get("code") == 1
    filters: PlatformFilters
  ]
]

module.exports = Schema