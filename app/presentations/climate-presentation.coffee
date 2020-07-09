Mediator 			= require "mediator"
Presentation 	= require "presentations/base/presentation"

module.exports = class ClimatePresentation extends Presentation
	layers:
		"rain": 					[L.tileLayer config.tiles.rain]
		"wind": 					[L.tileLayer config.tiles.wind, {opacity: 0.3}]
		"snow": 					[L.tileLayer config.tiles.snow]
		"clouds": 				[L.tileLayer config.tiles.clouds]
		"pressure": 			[
			L.tileLayer config.tiles.pressure, {opacity: 0.3}
			L.tileLayer config.tiles.pressureContour
		]
		"temperature": 		[L.tileLayer config.tiles.temperature, {opacity: 0.3}]
		"precipitation": 	[L.tileLayer config.tiles.precipitation, {opacity: 0.6}]

	render: () =>
		layer = $ ".layer", @parent
		layer.bind "mclick", @toggle
		Mediator.subscribe "presentation:stop", @removeAllLayers

	setStyle: (object) =>
		super

	toggle: (ev) =>
		target = $ ev.currentTarget
		dataLayer = target.data "layer"

		if $(target).hasClass "checked"
			_.each @layers[dataLayer], (layer) => window.map.removeLayer layer
		else
			_.each @layers[dataLayer], (layer) => window.map.addLayer layer

		$(target).toggleClass "checked"
		$(window).trigger "iscroll-refresh"

	removeAllLayers: =>
		_.each @layers, (layersList) => _.each layersList, (layer) => window.map.removeLayer layer