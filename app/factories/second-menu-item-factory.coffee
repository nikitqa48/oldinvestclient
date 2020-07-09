SecondMenuItemView 			= require "views/menu/second/second-menu-item-view"
PresentationMenuItemView 	= require "views/menu/second/presentation-menu-item-view"

SecondMenuItemFactory =
  presentations: ["geography", "population", "administrative", "unemployment", "density", "climate", "transport", "about"]

  get: (data) ->
    if @presentations.indexOf(data.key) != -1
      new PresentationMenuItemView data
    else
      new SecondMenuItemView data

module.exports = SecondMenuItemFactory