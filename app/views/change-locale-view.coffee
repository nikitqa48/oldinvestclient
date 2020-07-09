View = require "views/view"
template = require "views/templates/change-locale"

class ChangeLocaleView extends View
  autoRender: yes
  region: "changeLocale"
  className: "change-locale"
  template: template
  afterRender: =>
    @$el.data "locale", @otherLocales[window.i18n.locale]
    @$el.mclick @changeLocale

  beforeRender: =>
    @otherLocales =
      ru: "en",
      en: "ru"

  changeLocale: (ev)=>
    target = $ ev.currentTarget
    locale = target.data "locale"
    $.cookie "currentLocale", locale
    window.location.reload()
    no

  getTemplateData: =>
    _.extend super,
      otherLocales: @otherLocales
      currentLocale: window.i18n.locale

module.exports = ChangeLocaleView