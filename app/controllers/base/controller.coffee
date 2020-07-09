Mediator = require "mediator"
SiteView = require "views/site-view"
HeaderView = require "views/header-view"
SearchView = require "views/search-view"
MainMenuView = require "views/menu/main/main-menu-view"
MapView = require "views/map-view"
ItemsListView = require "views/items-list-view"
FooterView = require "views/footer-view"

module.exports = class Controller extends Chaplin.Controller
  beforeAction: =>
    @compose "site", SiteView
    @compose "header", HeaderView
    @compose "footer", FooterView
    @compose "main-menu", MainMenuView
    @compose "map", MapView
    @compose "items-list", ItemsListView
