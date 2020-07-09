i18n = require("lib/i18n")
i18n.configure "en",
  locales:
    ru: "Ru"
    en: "En"

  menu: 
    region: "About region"
    projects: "Projects"
    platforms: "Platforms" 

  second_menu:
    for_industry: "For industry"
    for_agriculture: "For agriculture"
    natural_heritage: "Natural heritage"
    building: "Buildings"
    done: "Done"
    need_money: "Needs money"
    idea: "Invest ideas"
    planned: "Planned"
    population: "Population"
    geography: "Geography"
    administrative: "administrative division"
    unemployment: "The unemployment rate"
    density: "The population density"
    climate: "Climatic conditions"
    transport: "Transport accessibility"
    development_plans: "Infrastructure development plan"
    special_economic_zones: "Special economic zones"
    industrial_parks: "Industrial parks"
    clusters: "Clusters"
    about: "Basic information"

  titles:
    search: "Search"
    basic_information: "Basic information"
    search_not_found: "Not found"
    sitename: "Investment map"
    region: "Lipetsk Oblast"
    designation: "Symbols"
    send_email: "Send email"
    participate: "Participate"
    natural_resources: "Natural resources"
    distance_to_moscow: "Distance to Moscow"
    distance_to_lipetsk: "Distance to Lipetsk"
    designation:
        part1: "Designation"
        part2: "symbols"

  tilelayers:
    clouds: "Cloudiness (%)"
    precipitation: "Rainfall (mm)"
    rain: "Rain"
    pressure: "Pressure (mm Hg. Art.)"
    pressureContour: "The isolines of pressure"
    wind: "Скорость ветера (mps)"
    temperature: "Temperature (°C)"
    snow: "Snow"

  presentations:
    geography:
      countries: "World countries"
      russia: "Russian Federation"
      lipetsk: "Lipetsk Oblast"
      administrative: "Administrative division"
      municipalities: "Municipalities"

  raker:
    title: "Search parameters"

  filters:
    investment:
      title: "Volume of investments"

    area:
      title: "area"

    stage:
      title: "Project status"
      add_btn: "Add status"

    ownership_type:
      title: "Ownership type"
      add_btn: "Add type"

    natural_resource_types:
      title: "Natural resource types"
      add_btn: "Add type"

    land_category:
      title: "Land category"
      add_btn: "Add category"

    project_type:
      title: "Project type"
      add_btn: "Add type"

    support_type:
      title: "Support type"
      add_btn: "Add type"

    right_form:
      title: "Right form"
      add_btn: "Add form"

    territory_type:
      title: "Territory type"
      add_btn: "Add territory type"

    city_distance:
      title: "Distance to Petropavlovsk-Kamchatskiy"

  values:
    thousand: "th."
    million: "mln."
    billion: "bln."

  area:
    he: "hectare"

  currency:
    rub: "rub."
    dollar: "$"
    hectare: "hectare"
    km: "km"
    m: "m"

  loading:
    primary: "Primary init"
    data: "Getting data"
    processing: "Data processing"
    error: "Error. Server not available"
    draw: "Rendering"

  buttons:
    back: "Back"
    close: "Close"
    search: "Search"
    on: "on"
    off: "off"
    more: "More"
    send: "Send"
    home: "Home"
    apply: "Apply"
    print: "Print"
    pdf: "PDF"
    send_email: "Send email"
    read_more: "More"
    cancel: "Cancel"

  share:
    twitter: "Share to twitter"
    facebook: "Share to facebook"
    vkontakte: "Share to vk"

  companies:
    count_label:
      one: "%{n} company"
      few: "%{n} companies"
      many: "%{n} companies"
      other: "%{n} companies"

  tables:
    about_buildings: "Information about buildings"

  change_browser:
    title: "Your browser is out of date"
    project: "You're on the investment map of the Kamchatka Krai"
    about_downloading_new_version: "Sorry, your browser does not support some of the technology used to create the application. We recommend that you upgrade your browser by clicking on the"
    download_link: "the link"

  layers:
    projects: "Investment projects"
    platforms: "Investment platforms"
    culturalHeritages: "Cultural Heritages"
    info_layers: "Info layers"

  models:
    project: "Investment project"
    platform: "Investment platform"
    city: "City"

  objects:
    projects: "Investment projects"
    platforms: "Investment platforms"
    cities: "Cities"
    municipalities: "Municipalities"
    natural_resources: "Natural resources"
    special_economic_zones: "Special economic zones"

  infra_layers:
    title: "Infrastructural objects" 
    gas_distribution_stations: "Gas distribution stations"
    gas_pipelines: "Gas pipelines"
    heat_only_boiler_stations: "Heat only boiler stations"
    central_heating_units: "Central heating units"
    heating_mains: "Heating mains"
    diesel_power_plants: "Diesel power plants"
    duel_fuel_power_plants: "Duel fuel power plants"
    geothermal_electricity_plants: "Geothermal electricity plants"
    hydro_plants: "Hydro plants"
    wind_plants: "Wind plants"
    transformer_substations: "Transformer substations"
    point_of_interests: "Points of interests"
    electric_power_transmissions: "Electric power transmissions"
    intakes: "Intakes"
    water_supplies: "Water supplies"
    wastewater_treatment_plants: "Wastewater treatment plants"
    sewers: "Sewers"

  cities:
    attributes:
      code: "Code"
      name: "Name"
      key: "Key"
      coords: "Coorinates"
      description: "Description"
      population: "Population"
      area: "Ares"
      based: "Based"
      chief: "Chief"
      site: "Site"
      density: "Density"
      subdivisions: "Subdivisions"
      economically_active_population: "Economically active population"

  platforms:
    attributes:
      permitted_uses: "Permitted uses"
      ownership_type_code: "Ownership type"
      ownership_type_tooltip: "Please, select ownership type"
      code: "Code"
      name: "Name"
      company_text: "Enterprise (organization) - the owner"
      key: "Key"
      owner_id: "Owner"
      description: "Description"
      area: "Area"
      ownership_type: "Ownership type"
      term_code: "Terms"
      right_form: "Right form"
      land_category: "Land category"
      settlement: "Settlement"
      investment_direction: "Investment direction"
      city_distance: "City distance"
      railway: "Railway"
      road: "Road"
      contact_info: "Contacts"
      phone: "Phone"
      email: "E-mail"
      expandable: "Expandable"
      municipality: "Municipality"
      platform_type: "Platform type"
      demo_mode: "Demo mode"
      coords: "Coorinates"
      territory_type_code: "Territory type code"
      legal_address: "Legal address"
      company_id: "Company"
      contact_person: "Contact person"
      contact_person_email: "Contact person email"
      contact_person_phone: "Contact person phone"
      address: "Address"
      land_ownership_type: "Land ownership"
      nearby_facilities: "Nearby facilities"
      nearest_houses_distance: "Nearest houses distance"
      limitations: "Limitations"
      government_agency_providing_land: "Government agency providing land"
      cadastral_number: "Cadastral number"
      sanitary_protection_zones: "Sanitary protection zones"
      transportation_driveways: "Transportation driveways"
      region_distance: "Region distance"
      road_distance: "Road distance"
      airport_distance: "Airport distance"
      seaport_distance: "Seaport distance"
      land_category_code: "Land category"
      land_category_tooltip: "Please, select land category"
      gas: "Gas"
      gas_details: "Gas (details)"
      electricity: "Electricity"
      electricity_details: "Electricity (details)"
      water: "Water"
      water_details: "Water (details)"
      sewerage: "Sewerage"
      sewerage_details: "Sewerage (details)"
      sewage_plants: "Sewage plants"
      sewage_plants_details: "Sewage plants (details)"
      heating: "Heating"
      heating_details: "Heating (details)"
      boiler_system: "Boiler system"
      boiler_system_details: "Boiler system (details)"
      municipality_id: "Municipality"

  companies:
    attributes:
      code: "Code"
      name: "Name"
      description: "Description"
      municipality: "Municipality"
      activity_sphere_code: "Activity sphere"
      nomenclature: "Nomenclature"

  municipalities:
    attributes:
      code: "Code"
      name: "Name"
      key: "Key"
      coords: "Coorinates"
      description: "Description"
      owner_id: "Owner"
      area: "Ares"
      density: "Density"
      population: "Population"
      chief: "Chief"
      status: "Status"
      based: "Based"
      company: "Company"
      average_wage: "Average wage"
      number_of_unemployed: "Number of unemployed"
      registered_unemployment: "Registered unemployment"
      distance_to_petropavlovsk_kamchatsky: "Distance to Petropavlovsk-Kamchatsky"
      distance_to_moscow: "Distance to Moscow"
      contacts: "Contacts"

  special_economic_zones:
    attributes:
      name: "Name"
      sez_type: "Sez type"
      municipality_id: "Municipality"
      company: "Company"
      contact_person: "Contact person"
      contact_phone: "Phone"
      contact_email: "Email"
      address: "Address"
      free_square: "Free square(m2)"
      residents: "Residents"
      authorized_activities: "Authorized activities"
      protection_zones: "Protection zones"
      transport_driveways: "Transport driveways"
      resident_privileges: "Resident privileges"
      central_region_distance: "Central region distance, km"
      city_distance: "City distance, km"
      road_distance: "Road distance, km"
      airport_distance: "Airport distance, km"
      seaport_distance: "Seaport distance, km"
      gas: "Gas"
      gas_details: "Power gas in cubic m/ hour"
      heating_details: "Power heating in Gcal / hour"
      electricity_details: "Power electricity in MW"
      heating: "heating"
      electricity: "Electricity"
      water: "Water"
      water_details: "Power water in cubic m/ hour"
      sewerage: "Sewerage"
      sewerage_details: "Sewerage (details)"
      sewage_plants: "Sewage plants"
      sewage_plants_details: "Sewage plants (details)"
      boiler_system: "Boiler system"
      boiler_system_details: "Boiler system (details)"
      municipality_tooltip: "Please choose municipality"

  territorial_development_areas:
    attributes:
      name: "Name"
      address: "Address"
      description: "Description"
      companies_residents: "Companies residents"
      square: "Square"
      investment: "Investment"
      priority_directions: "Priority directions"
      date_of_creation: "Date of creation"
      region_distance: "Region distance, km"
      another_region_distance: "Another region distance, km"
      road_distance: "Road distance, km"
      airport_distance: "Airport distance, km"
      city_distance: "City distance, km"
      seaport_distance: "Seaport distance, km"
      electricity: "Electricity"
      electricity_details: "Electricity (details)"
      water: "Water"
      water_details: "Water (details)"
      sewerage: "Sewerage"
      sewerage_details: "Sewerage (details)"
      sewage_plants: "Sewage plants"
      sewage_plants_details: "Sewage plants (details)"
      heating: "heating"
      heating_details: "Heating (details)"
      boiler_system: "Boiler system"
      boiler_system_details: "Boiler system (details)"
      resident_privileges: "Resident privileges"
      resident_privileges_details: "Resident privileges details"
      additional_information: "Additional information"

  clusters:
    attributes:
      name: "Name"
      municipality_id: "Municipality"
      municipality_tooltip: "Select municipality"
      description: "Description"
      company: "Company"
      legal_address: "Legal address"
      contact_person: "Contact person"
      contact_phone: "Contact phone"
      contact_email: "Contact email"
      address: "Address"
      free_square: "Free square (m2)"

  industrial_parks:
    attributes:
      name: "Name"
      municipality_id: "Municipality"
      municipality_tooltip: "Select municipality"
      park_type: "Park type"
      description: "Description"
      company: "Company"
      legal_address: "Legal address"
      contact_person: "Contact person"
      contact_phone: "Contact phone"
      contact_email: "Contact email"
      address: "Address"
      free_square: "Free square (m2)"
      residents: "Residents"
      nearest_houses_distance: "Nearest houses distance"
      protection_zones: "Protection zones"
      transport_driveways: "Transport driveways"
      services: "Services"
      authorized_activities: "Authorized activities"
      central_region_distance: "Central region distance, km"
      another_region_distance: "Another region distance, km"
      city_distance: "City distance, km"
      road_distance: "Road distance, km"
      airport_distance: "Airport distance, km"
      seaport_distance: "Seaport distance, km"
      demo_mode: "Demo mode"
      gas: "Gas"
      gas_details: "Gas details"
      heating: "Heating"
      heating_details: "Heating details"
      electricity: "Electricity"
      electricity_details: "Electricity details"
      water: "Water"
      water_details: "Water details"
      sewerage: "Sewerage"
      sewerage_details: "Sewerage"
      sewage_plants: "Sewage plants"
      sewage_plants_details: "Sewage plants (details)"
      boiler_system: "Boiler system"
      boiler_system_details: "Boiler system (details)"

  projects:
    attributes:
      code: "Code"
      name: "Name"
      key: "Key"
      territory: "Territory"
      territory_code: "Territory code"
      project_type_id: "Project type"
      owner_id: "Owner"
      ownership_type_code: "Ownership type"
      land_category_code: "Land category"
      registration_number: "Registration number"
      area: "Area"
      coordinator_code: "Coordinator"
      investor_code: "Investor"
      address: "Address"
      goal: "Goal"
      gics_code: "GICS code"
      design_capacity: "Design capacity"
      year_start: "Start year"
      year_end: "End year"
      curator_code: "Curator"
      project_kind_code: "Proect kind"
      payback_period: ", Payback period, years"
      payback_period_comment: "Payback period comment"
      profitability: "Profitability"
      profitability_comment: "Profitability comment"
      investment: "Investment"
      stage_code: "Stage"
      jobs: "Jobs"
      tax: "Tax"
      tax_comment: "Tax comment"
      roads: "Roads"
      infrastructure: "infrastructure"
      railroad: "Railroads"
      railroad_distance: "Railroad distance"
      water_supply: "Water supply",
      outfall: "Outfall",
      gas_supply: "Gas supply",
      electric_supply: "Electricity",
      gic_number_code: "GIC number",
      contacts: "Contacts",
      business_project: "Business project",
      company_id: "Company",
      economic_activity_code: "Economic activity",
      economic_activity_tooltip: "Please, select economic activity",
      territory_description: "Territory description",
      availability_of_raw: "Availability of raw",
      planned_production: "Planned production",
      consumer_market_description: "consumer market description",
      readiness: "readiness",
      financial_evaluation: "Financial evaluation",
      common_price: "Common price, mln. rub",
      own_investments: "Own investments",
      municipality_id: "Municipality",
      municipality_tooltip:  "Choose municipality",
      required_investments: "Required investments",
      key_performance_indicators: "Key performance indicators",
      npv: "NPV, mln. rub",
      irr: "IRR, %",
      pi: "PI",
      social_significance: "Social significance",
      budget_efficiency: "Budget efficiency",
      investment_return_forms: "Investment return forms",
      additional_info: "Additional info"

  gas_distribution_stations:
    attributes:
      name: "Name"
      description: "Description"
      municipality_id: "Municipality"
      city_id: "City"
      out_1: "Out 1"
      thousand_m3h_1: "thousand m^3 hour 1"
      million_m3y_1: "mln. m^3 year 1"
      project_million_m3y_1: "Project mln. m^3 year 1"
      actual_million_m3y_1: "Actual mln. m^3 year 1"
      loading_1: "Loadeing, percent 1"
      out_2: "Out 2"
      thousand_m3h_2: "thousand m^3 hour 2"
      million_m3y_2: "mln. m^3 year 2"
      project_million_m3y_2: "Project mln. m^3 year 2"
      actual_million_m3y_2: "Actual mln. m^3 year 2"
      loading_2: "Loading, percent 2"
      owner: "Owner"
      relevance: "Relevance"
      operating_organization: "Operating organization"

  electric_power_transmissions:
    attributes:
      name: "Name"
      description: "Description"
      supplier: "Supplier"
      transmission_class: "Transmission class"
      city_from_id: "City from"
      city_to_id: "City to"
      number: "Number"
      owner: "Owner"
      relevance: "Relevance"
      operating_organization: "Operating organization"

  heat_only_boiler_stations:
    attributes:
      name: "Name"
      year_start: "Start year"
      owner: "Owner"
      operating_organization: "Operating organization"
      fuel_type: "Fuel type"
      boiler_type: "Boiler type"
      boiler_count: "Boiler count"
      boiler_year_start: "Boiler start year"
      boiler_power: "Boiler power (Gkal/hour)"
      connected_load: "Connected load (Gkal/hour)"
      boiler_performance: "Boiler performance"
      heat_production_in_year: "Heat production in year"
      relevance: "Relevance"

  transformer_substations:
    attributes:
      name: "Name"
      description: "Description"
      number: "Number"
      owner: "Owner"
      category: "Category"
      district: "District"
      address: "Address"
      relevance: "Relevance"
      operating_organization: "Operating organization"

  ideas:
    attributes:
      name: "Name"
      owner_id: "Owner"
      company_id: "Company"
      economic_activity_code: "Economic activity"
      territory_code: "Rerritory"
      territory_description: "Territory description"
      goal: "Goal"
      availability_of_raw: "Availability of raw"
      planned_production: "Planned production"
      consumer_market_description: "Consumer market description"
      jobs: "Jobs"
      development_stage: "Development stage"
      common_price: "Common proce mln. rub"
      own_investments: "Own investments mln. rub"
      required_investments: "Required investments mln. rub"
      implementation_period: "Implementation period (years)"
      investment_return_forms: "Investment return forms"
      additional_info: "Additional info"

  natural_resources:
    attributes:
      coords: "Marker on map"
      description: "Description"
      natural_resource_type_code: "Natural resource type"
      owner_id: "Owner"
      name: "Name of the field"
      content: "Content"
      reserve: "Balance reserve"
      licence: "Licence"
      additional_information: "Additional information"

  development_plans:
    attributes:
      development_plan_type: "Development plan type"
      development_plan_type_tooltip: "Select development plan type"

  search:
    nothing: "Nothing found"
    default_message: "You can find any objects"
    no_results: "Nothing found"
    type_select: "Select the type of object"
    search_string:
      project: "project"
      platform: "platform"
      city: "city"
      natural_resource: "natural resource"
      municipality: "municipality"

    comment:
      one: "For <span class='agreement'>«%{str}»</span> found %{n} matches"
      few: "For <span class='agreement'>«%{str}»</span> found %{n} matches"
      many: "For <span class='agreement'>«%{str}»</span> found %{n} matches"
      other: "For <span class='agreement'>«%{str}»</span> found %{n} matches"

  card:
    navigation:
      common_data: "Common data"
      description: "Description"
      pictures: "Gallery"
      buildings: "Buildings"
    blank_description: "No data"

  messages:
    mail:
      success: "Thank you!"
      info_success: "Successfully sent!"
      error: "Error"
      object_request: "Good afternoon. Your request has been made to obtain information about the following property:"
      send_mail: "Send mail"
      send_mail_description: "Please, enter your email address."
      submit: "Submit"
      subject: "Message from the site of the investment map of Kamchatka Krai"

  participate:
    button: "Participate"
    header: "Participate"
    content: "Please send request with your contact data for participate on this project"
    email: "E-MAIL(REQUIRED)"
    full_name: "FULL NAME(REQUIRED)"
    organization: "ORGANIZATION"
    request: "Request"

  listItem:
    cost: "Cost"

  designations:
    invest_projects: "Invest projects"
    invest_platforms: "Invest platforms"
    idea: "Invest ideas"