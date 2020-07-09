Mediator = require "mediator"

module.exports = class Presentation
	style:
		weight: 1
		color: '#324'
		fillOpacity: 0
		fillColor: '#324'
		transitionDuration: "2s"
		transitionProperty: "fill-opacity"

	constructor: (parent) ->
		@objects 	= []
		@parent = parent
		
		@render()
		Mediator.publish "presentation:start", @setStyle
		window.map.fitBounds [[53.587226, 40.7647752], [51.8870621, 37.7217164]] # fit to Lipetsk region

	setStyle: (object) =>
		@objects.push object

		# Disable popup
		object.polygon.on "click", (e) => Mediator.publish '!router:route', routeFor('items', object.model)
		object.polygon.off "popupopen"
		object.polygon.off "popupclose"
		object.polygon.unbindPopup()

    # Show label
		object.showLabel object.model.name()

	render: () =>

	reset: () =>
		_(@objects).each (object) => 
			object.hideLabel()

			# Restore popup
			object.polygon.off "click"
			object.polygon.bindPopup "", 		object.popupOptions()
			object.polygon.on "popupopen", 	=> object.toggleActive yes
			object.polygon.on "popupclose", => object.toggleActive no