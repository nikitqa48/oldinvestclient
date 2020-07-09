Mediator 			= require "mediator"
Presentation 	= require "presentations/base/presentation"

module.exports = class PopulationPresentation extends Presentation
	style:
		weight: 1
		color: '#fff'
		fillOpacity: 1

	setStyle: (object) =>
		@objects.push object
		
		object.activeStyle  = {weight: 3} # when polygon is selected
		object.defaultStyle = {weight: 1} # when polygon is not selected

		population = object.model.get "population"
		fillColor = switch
	      when population < 15000  	then "#e5c637"
	      when population < 20000  	then "#e7a649"
	      when population < 30000  	then "#eb8831"
	      when population < 40000 	then "#e76e2c"
	      when population < 50000 	then "#c92f23"
	      when population >= 50000 	then "#941616"

	    @style["fillColor"] = fillColor
	    object.polygon.setStyle @style

		# Disable popup
		object.polygon.on "click", (e) => Mediator.publish '!router:route', routeFor('items', object.model)
		object.polygon.off "popupopen"
		object.polygon.off "popupclose"
		object.polygon.unbindPopup()

    # Show label
		object.showLabel "#{object.model.name()}<br />#{t('second_menu.population')}: #{population}"