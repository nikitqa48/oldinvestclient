Mediator 			= require "mediator"
Presentation 	= require "presentations/base/presentation"

module.exports = class GeographyPresentation extends Presentation
	layers: []

	render: () =>
		@itemsList = $ "ul li", @parent
		@itemsList.bind "mclick", @setView

		$.getJSON "data/geography.geojson", (data) =>
			@lipetsk = L.geoJson data
			@lipetsk.setStyle
				color: "#E1582E"
				weight: 15
				opacity: 0.6
			@layers.push @lipetsk
			window.map.addLayer @lipetsk
			
			@lipetsk.bringToBack()
			window.map.fitBounds @lipetsk.getBounds()

	setView: (ev) =>
		target = $ ev.currentTarget
		key = target.data "key"
		@showView key

	showView: (key) =>
		switch key
			when "countries" 
				window.map.fitBounds [[36.03133177633189,-58.53515625],[76.31035754301745, 166.46484375]]
			when "russia"
				window.map.fitBounds [[70.1403642720717,119.35546875000001],[55.825973254619015, 6.85546875]]
			when "lipetsk"
				window.map.fitBounds [[53.58722,40.7647752],[51.8870621,37.7217164]]
			when "administrative"
				window.map.fitBounds [[53.58722,40.7647752],[51.8870621,37.7217164]]
			when "municipalities"
				window.map.fitBounds [[53.58722,40.7647752],[51.8870621,37.7217164]]

	reset: () =>
		super
		_.each @layers, (layer) => window.map.removeLayer layer