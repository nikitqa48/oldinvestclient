require 'config/i18n/ru'
require 'config/i18n/en'
require 'config/i18n/keys/en'
require 'config/i18n/keys/ru'
i18n = require 'lib/i18n'
i18n.locale = $.cookie("currentLocale") || config.defaultLocale
window.t = i18n.translate
