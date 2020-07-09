config =
  kiosk: false
  closable: false
  touch: false
  hideCursor: false
  defaultLocale: "ru"
  availableLocales: ["ru", "en"]
  host: "http://map.invest-lipetsk.com"
  adminHost: "http://mapadmin.invest-lipetsk.com"
  imageHost: "http://map.invest-lipetsk.com"
  hasTransformClass: "csstransforms"
  hasTransitionClass: "csstransitions"
  dataUrl:
    en: "data/en.jsonp"
    ru: "data/ru.jsonp"

  mystandUrl: "http://mystand.ru"

  demoMode:
    startDelay: 120
    interval: 10

  minZoom: 2
  maxZoom: 16

  tiles:
    url: "http://gerardus.mystand.ru/lipetsk/{z}/{x}/{y}.png"
    options:
      tms: true
      noWrap: true
      reuseTiles: true
      updateWhenIdle: false
      continuousWorld: false
    clouds:           "http://{s}.tile.openweathermap.org/map/clouds/{z}/{x}/{y}.png"
    precipitation:    "http://{s}.tile.openweathermap.org/map/precipitation/{z}/{x}/{y}.png"
    rain:             "http://{s}.tile.openweathermap.org/map/rain/{z}/{x}/{y}.png"
    pressure:         "http://{s}.tile.openweathermap.org/map/pressure/{z}/{x}/{y}.png"
    pressureContour:  "http://{s}.tile.openweathermap.org/map/pressure_cntr/{z}/{x}/{y}.png"
    wind:             "http://{s}.tile.openweathermap.org/map/wind/{z}/{x}/{y}.png"
    temperature:      "http://{s}.tile.openweathermap.org/map/temp/{z}/{x}/{y}.png"
    snow:             "http://{s}.tile.openweathermap.org/map/snow/{z}/{x}/{y}.png"

  administrative_centre_latlng: [52.59804297332564, 39.57412719726562]
  defaultBounds: [[52.018698,37.742672],[52.254709,40.796871],[53.585984,39.736691]]

  # tiles:
  #   url: "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
  #   options:
  #     tms: false
  #     reuseTiles: true
  #     updateWhenIdle: true

  kinect: false
  browsers:
    chrome:
      tiles: 5
      full: 10
      downloadLink: "http://www.google.com/chrome"

    firefox:
      tiles: 3.5
      full: 4
      downloadLink: "http://www.mozilla.org"

    safari:
      tiles: 3
      full: 4
      downloadLink: "http://www.apple.com/safari"

    opera:
      tiles: 8
      full: 9.8
      downloadLink: "http://opera.com"

    msie:
      tiles: 8
      full: 9
      downloadLink: "http://windows.microsoft.com/en-us/internet-explorer/products/ie/home"

  print: true
  pdf: true
  pdfModels: ["Project", "Platform", "Idea"]
  sharing:
    twitter: true
    facebook: true
    vkontakte: true

  excludedFields: [
    "code", "coords", "pictures", "name", "owner_id", "description", "goal", "buildings", "platform_type_code", "demo_mode",
    "gas", "heating", "electricity", "water", "sewerage", "sewage_plants", "boiler_system","dbId", "key",
    "point_of_interest_type_code", "remote_code", "hidden", "published", "logo", "development_plan_type_code"
  ]

module.exports = config
window.config = config
