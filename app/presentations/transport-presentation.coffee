Mediator 			= require "mediator"
Presentation 	= require "presentations/base/presentation"

module.exports = class TransportPresentation extends Presentation
	layers: []

	render: () =>
		# Northern sea route
		$.getJSON "data/north-sea-route.geojson", (data) =>
			layer = L.geoJson data
			layer.setStyle
				color: "#39568E"
				weight: 15
				opacity: 0.6
			@layers.push layer
			window.map.addLayer layer

	reset: () =>
		_.each @layers, (layer) => window.map.removeLayer layer