config = require 'config/config'

class I18n
  constructor: (data) ->
    @data = data or {}
    @locale = config.defaultLocale

  configure: (locale, data) =>
    @data[locale] = _(@data[locale] or {}).extend(data)

  translate: =>
    args = arguments
    path = args[0]
    pointsPath = path
    path = "[\"" + path.split(".").join("\"][\"") + "\"]"

    try
      res = eval("this.data." + @locale + path)

      throw ("undefined")  if res is undefined
      if _(res).isObject()
        pluralizeCount = _(arguments_).last()
        pluralizeKey = @getPluralizeKey(pluralizeCount)
        res = res[pluralizeKey]
      params = res.match(/%{.+?}/g)
      _(params).each (param, index) ->
        res = res.replace(param, args[index + 1])
      return res
    catch err
      return "translation missing " + pointsPath

  getPluralizeKey: (n) =>
    switch config.currentLocale
      when "ru"
        return @getPluralizeKeyRu(n)
      when "en"
        return @getPluralizeKeyEn(n)

  getPluralizeKeyEn: (n) =>
    (if (n is 1) then "one" else "other")

  getPluralizeKeyRu: (n) =>
    unless (n % 10 is 1) and (n % 100 isnt 11)
      if _([2, 3, 4]).include(n % 10) and (not _([12, 13, 14]).include(n % 100))
        "few"
      else
        if (n % 10 is 0) or (_([5, 6, 7, 8, 9]).include(n % 10)) or (_([11, 12, 13, 14]).include(n % 100))
          "many"
        else
          "other"

window.i18n = window.i18n or new I18n()
module.exports = i18n