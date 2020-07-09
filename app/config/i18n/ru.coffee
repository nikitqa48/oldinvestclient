i18n = require("lib/i18n")
i18n.configure "ru",
  locales:
    ru: "Ru"
    en: "En"

  menu: 
    region: "О регионе"
    projects: "Проекты"
    platforms: "Площадки"

  second_menu:
    for_industry: "Земли для промышленности"
    for_agriculture: "Земли для сельского хозяйства"
    special_economic_zones: "Особые экономические зоны"
    industrial_parks: "Индустриальные парки"
    natural_heritage: "Природное достояние"
    building: "Земли под жилую застройку"
    done: "Реализованные"
    need_money: "Реализуемые"
    idea: "Инвестидеи"
    planned: "Планируемые"
    geography: "Географическое положение"
    administrative: "Административное деление"
    unemployment: "Уровень безработицы"
    population: "Численность населения"
    density: "Плотность населения"
    climate: "Климатические условия"
    transport: "Транспортная доступность"
    development_plans: "План развития инфраструктуры"
    clusters: "Кластеры"
    about: "Общая информация"

  titles:
    search: "Поиск"
    basic_information: "Общая информация о регионе"
    search_not_found: "По вашему запросу ничего не найдено"
    sitename: "Инвестиционная карта"
    region: "Липецкой области"
    designation: "Условные обозначения"
    send_email: "Отправить на почту"
    participate: "Участвовать"
    natural_resources: "Природные ресурсы"
    distance_to_moscow: "Расстояние до Москвы"
    distance_to_lipetsk: "Расстояние до Липецка"
    designation:
      part1: "Условные"
      part2: "обозначения"

  tilelayers:
    clouds: "Облачность (%)"
    precipitation: "Осадки (мм)"
    rain: "Дождь"
    pressure: "Давление (мм рт. ст.)"
    pressureContour: "Изолинии давления"
    wind: "Скорость ветера (м/с)"
    temperature: "Температура (°C)"
    snow: "Снег"

  presentations:
    geography:
      countries: "Мир"
      russia: "Россия"
      lipetsk: "Область"
      administrative: "Районы"
      municipalities: "Города"

  raker:
    title: "параметры поиска"

  filters:
    investment:
      title: "Объем инвестиций"

    area:
      title: "Площадь территории"

    stage:
      title: "Состояние проекта"
      add_btn: "Добавить состояние"

    ownership_type:
      title: "Типы собственности"
      add_btn: "Добавить тип"

    natural_resource_types:
      title: "Типы натуральных ресурсов"
      add_btn: "Добавить тип"

    land_category:
      title: "Категория земли"
      add_btn: "Добавить категорию"

    project_type:
      title: "Типы проекта"
      add_btn: "Добавить тип"

    support_type:
      title: "Типы поддержки"
      add_btn: "Добавить тип"

    right_form:
      title: "Условия предоставления инвестиционной площадки инвестору"
      add_btn: "Добавить"

    territory_type:
      title: "Тип площадки"
      add_btn: "Добавить"

    city_distance:
      title: "Расстояние до Липецка"

  values:
    thousand: "тыс."
    million: "млн."
    billion: "млрд."

  area:
    he: "Га"

  currency:
    rub: "руб."
    dollar: "$"
    hectare: "га"
    km: "км"
    m: "м"
    sq_m: "кв. м"

  loading:
    primary: "Первичная загрузка"
    data: "Получение данных"
    processing: "Обработка данных"
    error: "Ошибка. Сервер не отвечает"
    draw: "Отрисовка"

  buttons:
    back: "Назад"
    close: "Закрыть"
    search: "Поиск"
    on: "вкл."
    off: "выкл."
    more: "Подробнее"
    home: "На главную"
    send: "Отправить"
    apply: "Применить"
    print: "Распечатать"
    pdf: "PDF"
    send_email: "Отправить на почту"
    read_more: "Подробнее"
    cancel: "Отменить"

  share:
    twitter: "Поделиться в твиттере"
    facebook: "Поделиться в фейсбуке"
    vkontakte: "Поделиться в контакте"

  companies:
    count_label:
      one: "%{n} компания"
      few: "%{n} компаний"
      many: "%{n} компаний"
      other: "%{n} компании"

  tables:
    about_buildings: "Информация о строениях"

  change_browser:
    title: "Ваш браузер устарел"
    project: "Вы находитесь на инвестиционнной карте Липецкой области"
    about_downloading_new_version: "К сожалению Ваш браузер не поддерживает некоторые технологии, использованные при создании приложения. Мы рекомендуем Вам обновить браузер, щелкнув по"
    download_link: "этой ссылке"

  layers:
    projects: "Инвест проекты"
    platforms: "Инвест площадки"
    culturalHeritages: "Культурное наследие"
    info_layers: "Инфослои"

  models:
    project: "Инвест проект"
    platform: "Инвест площадка"
    city: "Город"

  objects:
    projects: "Инвест проекты"
    platforms: "Инвест площадки"
    cities: "Города"
    municipalities: "Муниципалитеты"
    natural_resources: "Природные ресурсы"
    special_economic_zones: "Особые экономические зоны"

  infra_layers:
    title: "Инфраструктурные объекты" 
    gas_distribution_stations: "Газораспределительные станции"
    gas_pipelines: "Газопровод"
    heat_only_boiler_stations: "Котельные"
    central_heating_units: "Центральные тепловые пункты"
    heating_mains: "Теплотрассы"
    diesel_power_plants: "Дизельная электростанция"
    duel_fuel_power_plants: "ГДЭС"
    geothermal_electricity_plants: "ГеоЭС"
    hydro_plants: "ГЭС"
    wind_plants: "ВЭС"
    point_of_interests: "Точки интереса"
    transformer_substations: "Трансформаторные подстанции"
    electric_power_transmissions: "Линии электропередач"
    intakes: "Водозаборные сооружения"
    water_supplies: "Сети водоснабжения"
    wastewater_treatment_plants: "Очистные сооружения"
    sewers: "Коллектор"

  cities:
    attributes:
      code: "Код"
      name: "Название"
      key: "Ключ"
      coords: "Отметка на карте"
      description: "Описание"
      population: "Численность населения"
      area: "Площадь территории, га"
      based: "Основан, год"
      chief: "Глава"
      site: "Сайт"
      density: "Плотность населения"
      subdivisions: "Внутреннее деление"
      economically_active_population: "Экономически активное население"

  platforms:
    attributes:
      permitted_uses: "Предполагаемое разрешенное использование"
      ownership_type_code: "Тип собственности"
      ownership_type_tooltip: "Пожалуйста, выберите тип собственности"
      code: "Код"
      name: "Название"
      company_text: "Предприятие (организация) - владелец"
      key: "Ключ"
      owner_id: "Владелец"
      description: "Описание"
      area: "Площадь территории, га"
      ownership_type: "Тип собственности"
      term_code: "Условия предоставления инвестиционной площадки инвестору"
      right_form: "Условия предоставления инвестиционной площадки инвестору"
      land_category: "Категория земель"
      settlement: "Населенный пункт"
      investment_direction: "Направление инвестирования"
      city_distance: "Удаленность от ближайшего административного центра, км"
      railway: "Наличие ж/д путей"
      road: "Автомобильная дорога"
      contact_info: "Контактное лицо"
      phone: "Телефон"
      email: "E-mail"
      expandable: "Возможность расширения до, га"
      municipality: "Муниципалитет"
      platform_type: "Тип инвестплощадки"
      demo_mode: "Включить в демо режим"
      coords: "Координаты"
      territory_type_code: "Тип территории"
      legal_address: "Юридический адрес"
      company_id: "Организация"
      contact_person: "Контактное лицо"
      contact_person_email: "Эл. почта контактного лица"
      contact_person_phone: "Телефон контактного лица"
      address: "Адрес места расположения площадки"
      land_ownership_type: "Вид права владения землей"
      nearby_facilities: "Близлежащие производственные объекты и расстояние до них"
      nearest_houses_distance: "Расстояние до ближайших жилых домов"
      limitations: "Ограничения (обременения)"
      government_agency_providing_land: "Орган, осуществляющий предоставление земельного участка"
      cadastral_number: "Кадастровый номер"
      sanitary_protection_zones: "Наличие санитарно-защитных/охранных зон"
      transportation_driveways: "Наличие транспортных подъездных путей"
      region_distance: "Удаленность участка от центра другого ближайшего субъекта Российской Федерации, км"
      road_distance: "Удаленность участка от ближайшей автодороги, км"
      airport_distance: "Удаленность участка от ближайшего аэропорта, км"
      seaport_distance: "Удаленность участка от ближайшего морского порта, км"
      land_category_code: "Категория земель"
      land_category_tooltip: "Пожалуйста, выберите категорию земель"
      gas: "Газификация"
      gas_details: "Газификация (описание)"
      electricity: "Электроэнергия"
      electricity_details: "Электроэнергия (описание)"
      water: "Водоснабжение"
      water_details: "Водоснабжение (описание)"
      sewerage: "Канализация"
      sewerage_details: "Канализация (описание)"
      sewage_plants: "Очистные сооружения"
      sewage_plants_details: "Очистные сооружения (описание)"
      heating: "Отопление"
      heating_details: "Отопление (описание)"
      boiler_system: "Котельные установки"
      boiler_system_details: "Котельные установки (описание)"
      municipality_id: "Муниципалитет"

  companies:
    attributes:
      code: "Код"
      name: "Название"
      description: "Описание"
      municipality: "Муниципалитеты"
      activity_sphere_code: "Сфера деятельности"
      nomenclature: "Номенклатура выпускаемой продукции"

  municipalities:
    attributes:
      code: "Код"
      name: "Название"
      key: "Ключ"
      coords: "Отметка на карте"
      description: "Описание"
      owner_id: "Владелец"
      area: "Площадь, га"
      density: "Плотность населения, чел./км²"
      population: "Население"
      chief: "Глава"
      status: "Статус"
      based: "Основан"
      company: "Предприятия"
      average_wage: "Cредняя заработная плата МО"
      number_of_unemployed: "Численность безработных в МО, чел."
      registered_unemployment: "Уровень зарегистрированной безработицы по МО, % "
      distance_to_petropavlovsk_kamchatsky: "Расстояние до Липецка, км."
      distance_to_moscow: "Расстояние до Москвы, км."
      contacts: "Контактная информация"

  special_economic_zones:
    attributes:
      name: "Название"
      sez_type: "Тип ОЭЗ"
      municipality_id: "Муниципальный район"
      municipality_tooltip: "Выберите муниципальный район"
      special_economic_zone_type: "Тип ОЭЗ"
      special_economic_zone_type_code: "Тип ОЭЗ"
      special_economic_zone_type_tooltip: "Выберите тип ОЭЗ"
      company: "Предприятие (организация)"
      contact_person: "Контактное лицо"
      contact_phone: "Телефон контактного лица"
      contact_email: "Эл. почта"
      address: "Адрес места расположения площадки"
      free_square: "Свободные площади (кв. м)"
      residents: "Предприятия-резиденты"
      authorized_activities: "Разрешенные виды деятельности"
      protection_zones: "Cанитарно-защитные или охранные зоны"
      transport_driveways: "Наличие транспортных подъездных путей"
      resident_privileges: "Льготы и преференции для резидентов ОЭЗ"
      central_region_distance: "Удаленность зоны от центра субъекта Российской Федерации, км"
      city_distance: "Удаленность от ближайшего города, км"
      road_distance: "Удаленность от ближайшей автодороги, км"
      airport_distance: "Удаленность от ближайшего аэропорта, км"
      seaport_distance: "Удаленность от ближайшего морского порта, км"
      gas: "Газ"
      gas_details: "Мощность газоснабжения в куб. м/час"
      heating: "Отопление"
      heating_details: "Мощность отопления в гКал/час"
      electricity: "Электроэнергия"
      electricity_details: "Мощность электроснабжения МВт"
      water: "Водоснабжение"
      water_details: "Мощность водоснабжения куб. м/час"
      sewerage: "Канализация"
      sewerage_details: "Канализация (описание)"
      sewage_plants: "Очистные сооружения"
      sewage_plants_details: "Очистные сооружения (описание)"
      boiler_system: "Котельные установки"
      boiler_system_details: "Котельные установки (описание)"

  territorial_development_areas:
    attributes:
      name: "Название"
      address: "Адрес (населенный пункт)"
      description: "Краткое описание реализуемого проекта"
      companies_residents: "Компании-резиденты"
      square: "Площадь земельного участка, Га"
      investment: "Запланированные государственные инвестиции, млн. р."
      priority_directions: "Приоритетные направления"
      date_of_creation: "Дата создания"
      region_distance: "Удаленность участка от центра субъекта Российской Федерации, км"
      another_region_distance: "Удаленность участка от центра другого ближайшего субъекта Российской Федерации, км"
      road_distance: "Удаленность участка от ближайшей автодороги, км"
      airport_distance: "Удаленность участка от ближайшего аэропорта, км"
      city_distance: "Удаленность участка от ближайшего города, км"
      seaport_distance: "Удаленность участка от ближайшего морского порта, км"
      electricity: "Электроэнергия"
      electricity_details: "Электроэнергия (описание)"
      water: "Водоснабжение"
      water_details: "Водоснабжение (описание)"
      sewerage: "Канализация"
      sewerage_details: "Канализация (описание)"
      sewage_plants: "Очистные сооружения"
      sewage_plants_details: "Очистные сооружения (описание)"
      heating: "Отопление"
      heating_details: "Отопление (описание)"
      boiler_system: "Котельные установки"
      boiler_system_details: "Котельные установки (описание)"
      resident_privileges: "Льготы резидентам"
      resident_privileges_details: "Укажите виды льгот"
      additional_information: "Дополнительная информация"

  clusters:
    attributes:
      name: "Название"
      municipality_id: "Муниципальный район"
      municipality_tooltip: "Выберите муниципальный район"
      description: "Описание площадки"
      company: "Предприятие (организация)"
      legal_address: "Юридический адрес"
      contact_person: "Контактное лицо"
      contact_phone: "Телефон контактного лица"
      contact_email: "Эл. почта"
      address: "Адрес места расположения площадки"
      free_square: "Свободные площади (кв. м)"

  industrial_parks:
    attributes:
      name: "Название"
      municipality_id: "Муниципальный район"
      municipality_tooltip: "Выберите муниципальный район"
      park_type: "Тип площадки"
      description: "Описание площадки"
      company: "Предприятие (организация)"
      legal_address: "Юридический адрес"
      contact_person: "Контактное лицо"
      contact_phone: "Телефон контактного лица"
      contact_email: "Эл. почта"
      address: "Адрес места расположения площадки"
      free_square: "Свободные площади (кв. м)"
      residents: "Предприятия-резиденты"
      nearest_houses_distance: "Расстояние до ближайших жилых домов"
      protection_zones: "Санитарно-защитные/охранные зоны"
      transport_driveways: "Наличие транспортных подъездных путей"
      services: "Услуги"
      authorized_activities: "Разрешенные виды деятельности"
      central_region_distance: "Удаленность площадки от центра субъекта Российской Федерации, км"
      another_region_distance: "Удаленность площадки от центра другого ближайшего субъекта Российской Федерации"
      city_distance: "Удаленность от ближайшего города, км"
      road_distance: "Удаленность от ближайшей автодороги, км"
      airport_distance: "Удаленность от ближайшего аэропорта, км"
      seaport_distance: "Удаленность от ближайшего морского порта, км"
      demo_mode: "Включить в демо-режим"
      gas: "Газ"
      gas_details: "Указать мощность в куб. м/час"
      heating: "Отопление"
      heating_details: "Указать мощность в Гкал/час"
      electricity: "Электроэнергия"
      electricity_details: "Указать мощность в  кВт/час"
      water: "Водоснабжение"
      water_details: "Указать мощность в куб. м/год"
      sewerage: "Канализация"
      sewerage_details: "Канализация (описание)"
      sewage_plants: "Очистные сооружения"
      sewage_plants_details: "Очистные сооружения (описание)"
      boiler_system: "Котельные установки"
      boiler_system_details: "Котельные установки (описание)"

  projects:
    attributes:
      code: "Код"
      name: "Название"
      key: "Ключ"
      territory: "Месторасположение"
      territory_code: "Месторасположение"
      project_type_id: "Тип проекта"
      owner_id: "Владелец"
      ownership_type_code: "Тип собственности"
      land_category_code: "Категория земель"
      registration_number: "Регистрационный номер"
      area: "Площадь территории"
      coordinator_code: "Координатор"
      investor_code: "Инвестор"
      municipality_id: "Муниципалитет"
      municipality_tooltip: "Выберите муниципалитет"
      address: "Адрес"
      goal: "Цель проекта"
      gics_code: "Номер ОКВЭД"
      design_capacity: "Производственные мощности"
      year_start: "Год начала проекта"
      year_end: "Год завершения проекта"
      curator_code: "Куратор"
      project_kind_code: "Вид проекта"
      payback_period: "Срок окупаемости, лет"
      payback_period_comment: "Комментарий к сроку окупаемости"
      profitability: "Рентабельность"
      profitability_comment: "Комментарий к рентабельности"
      investment: "Инвестиции"
      stage_code: "Стадия проекта"
      jobs: "Количество создаваемых рабочих мест"
      tax: "Налогообложение"
      tax_comment: "Комментарий по налогообложению"
      roads: "Подъездные пути"
      infrastructure: "Прочая инфраструктура"
      railroad: "Железнодорожные пути"
      railroad_distance: "Расстояние до ЖД"
      water_supply: "Водоснабжение",
      outfall: "Водоотвод",
      gas_supply: "Газоснабжение",
      electric_supply: "Электроснабжение" ,
      gic_number_code: "Номер ОКВЭД",
      contacts: "Контактная информация",
      business_project: "Бизнес-проект",
      company_id: "Компания",
      economic_activity_code: "Вид экономической деятельности (по ОКВЭД)",
      economic_activity_tooltip: "Пожалуйста, выберите вид экономической деятельности",
      territory_description: "Описание месторасположения",
      availability_of_raw: "Обеспечение сырьем",
      planned_production: "Планируемая продукция",
      consumer_market_description: "Описание рынка потребителей",
      readiness: "Степень готовности и экспертиза проекта",
      financial_evaluation: "Финансовая оценка проекта",
      common_price: "Общая стоимость проекта (в млн. руб.)",
      own_investments: "Собственные вкладываемые средства",
      municipality_id: "Муниципальное образование",
      municipality_tooltip:  "Пожалуйста, выберите ммуниципалитет",
      required_investments: "Требуемые инвестиции (в млн. руб.)",
      key_performance_indicators: "Основные показатели эффективности проекта",
      npv: "Чистая приведенная стоимость (NPV), млн. руб.",
      irr: "Внутренняя норма прибыли (IRR), %",
      pi: "Индекс рентабельности (PI)",
      social_significance: "Cоциальная значимость",
      budget_efficiency: "Бюджетная эффективность",
      investment_return_forms: "Формы возврата инвестиций",
      additional_info: "Дополнительная информация"

  gas_distribution_stations:
    attributes:
        name: "Название"
        description: "Описание"
        municipality_id: "Муниципалитет"
        city_id: "Поселение"
        out_1: "Выход Мпа 1"
        thousand_m3h_1: "Тыс. м. куб. час 1"
        million_m3y_1: "Миллионы м. куб. год 1"
        project_million_m3y_1: "Проектируемые миллионы м. куб. год 1"
        actual_million_m3y_1: "Фактические миллионы м. куб. год 1"
        loading_1: "Загрузка, проценты 1"
        out_2: "Выход Мпа 2"
        thousand_m3h_2: "Тыс. м. куб. час 2"
        million_m3y_2: "Миллионы м. куб. год 2"
        project_million_m3y_2: "Проектируемые миллионы м. куб. год 2"
        actual_million_m3y_2: "Фактические миллионы м. куб. год 2"
        loading_2: "Загрузка, проценты 2"
        owner: "Собственник"
        relevance: "Актуальность данных"
        operating_organization: "Эксплуатирующая организация"

  electric_power_transmissions:
    attributes:
      name: "Название"
      description: "Описание"
      supplier: "Поставщик"
      transmission_class: "Класс трансмиссии"
      city_from_id: "Откуда"
      city_to_id: "Куда"
      number: "Номер"
      owner: "Собственник объекта"
      relevance: "Актуальность данных"
      operating_organization: "Эксплуатирующая организация"

  heat_only_boiler_stations:
    attributes:
      name: "Название"
      year_start: "Год ввода в эксплуатацию котельной"
      owner: "Собственник котельной"
      operating_organization: "Эксплуатирующая организация"
      fuel_type: "Вид используемого топлива"
      boiler_type: "Тип установленных котлов"
      boiler_count: "Количество котлов, в т.ч. резервных"
      boiler_year_start: "Год ввода в эксплуатацию котлов"
      boiler_power: "Мощность котлов (Гкал/час)"
      connected_load: "Присоединенная нагрузка (Гкал/час)"
      boiler_performance: "КПД котлов"
      heat_production_in_year: "Выработка тепловой энергии в год"
      relevance: "Актуальность данных"

  transformer_substations:
    attributes:
      name: "Название"
      description: "Описание"
      number: "Номер"
      owner: "Собственник"
      category: "Класс"
      district: "Район"
      address: "Адрес расположения"
      relevance: "Актуальность данных"
      operating_organization: "Эксплуатирующая организация"

  ideas:
    attributes:
      name: "Название"
      owner_id: "Создатель"
      company_id: "Предприятие-инициатор"
      economic_activity_code: "Вид экономической деятельности (по ОКВЭД)"
      territory_code: "Месторасположение"
      territory_description: "Описание месторасположения"
      goal: "Бизнес-идея (цель)"
      availability_of_raw: "Обеспечение сырьем"
      planned_production: "Планируемая продукция"
      consumer_market_description: "Описание рынка потребителей"
      jobs: "Количество создаваемых рабочих мест"
      development_stage: "Стадия разработки идеи"
      common_price: "Общая стоимость идеи (в млн. руб.) в т.ч."
      own_investments: "- собственные вкладываемые средства (в млн. руб.)"
      required_investments: "- запрашиваемые инвестиции (в млн. руб.)"
      implementation_period: "Нормативный срок реализации идеи (лет)"
      investment_return_forms: "Формы возврата инвестиций"
      additional_info: "Дополнительная информация"

  natural_resources:
    attributes:
      natural_resource_type_code: "Тип природного ресурса"
      description: "Описание"
      owner_id: "Владелец"
      coords: "Координаты"
      name: "Наименование месторождения"
      content: "Содержание полезного компонента"
      reserve: "Общие балансовые запасы"
      licence: "Наличие лицензии"
      additional_information: "Дополнительная информация"

  development_plans:
    attributes:
      development_plan_type: "Тип плана развития"
      development_plan_type_tooltip: "Выберите тип плана развития"

  search:
    nothing: "Ничего не найдено"
    default_message: "Вы можете найти необходимые вам объекты"
    no_results: "Ничего не найдено"
    type_select: "Выберите тип объектов"
    search_string:
      project: "проект"
      platform: "площадка"
      city: "город"
      natural_resource: "полезные ископаемые ресурсы"
      municipality: "муниципалитет муниципальный район"
      industrial_park: "индустриальный парк"

    comment:
      one: "По запросу <span class='agreement'>«%{str}»</span> найдено %{n} совпадение"
      few: "По запросу <span class='agreement'>«%{str}»</span> найдено %{n} совпадения"
      many: "По запросу <span class='agreement'>«%{str}»</span> найдено %{n} совпадений"
      other: "По запросу <span class='agreement'>«%{str}»</span> найдено %{n} совпадения"

  card:
    navigation:
      common_data: "Общие данные"
      description: "Описание"
      pictures: "Фотографии"
      buildings: "Строения"
    blank_description: 'Не указано'

  messages:
    mail:
      success: "Спасибо, мы рассмотрим вашу заявку!"
      info_success: "Информация успешно отправлена!"
      error: "Не получилось отправить сообщение"
      object_request: "Добрый день. Вами был сделан запрос на получении информации о следующем объекте:"
      send_mail: "Отправить на почту"
      send_mail_description: "Для получения данных о площадке по почте, введите адрес вашего электронного ящика ниже."
      submit: "Отправить"
      subject: "Сообщение с сайта инвестиционной карты Липецкой области"

  participate:
    button: "Участвовать"
    header: "Принять участие"
    content: "Для размещения проектов на инвестиционной карте Липецкой области, заполните краткие данные о себе и мы обязательно с вами свяжемся"
    email: "E-mail"
    full_name: "Ф.И.О."
    organization: "Организация"
    request: "Содержание запроса"

  listItem:
    cost: "Стоимость"

  designations:
    invest_projects: "Инвестиционные проекты"
    invest_platforms: "Инвестиционные площадки"
    idea: "Инвестидеи"
