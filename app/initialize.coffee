Application = require 'application'
routes = require 'routes'
require 'config/i18n/initializer'

# Initialize the application on DOM ready event.
$ ->
  require "lib/iscroll-extensions"
  new Application
    title: 'Kamchatka client'
    controllerSuffix: '-controller'
    pushState: no
    routes: routes
