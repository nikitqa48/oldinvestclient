Mediator 			= require "mediator"
Presentation 	= require "presentations/base/presentation"

module.exports = class DensityPresentation extends Presentation
	style:
		weight: 1
		color: '#fff'
		fillOpacity: 1

	setStyle: (object) =>
		object.activeStyle  = {weight: 3} # when polygon is selected
		object.defaultStyle = {weight: 1} # when polygon is not selected

		density = object.model.get "density"
		fillColor = switch
	      when density < 20 	then "#FF822E"
	      when density < 30 	then "#FF6D1F"
	      when density < 40 	then "#FF6517"
	      when density < 50		then "#FA5B0F"
	      when density >= 50 	then "#EF5411"

	    @style["fillColor"] = fillColor
	    object.polygon.setStyle @style

		# Disable popup
		object.polygon.on "click", (e) => Mediator.publish '!router:route', routeFor('items', object.model)
		object.polygon.off "popupopen"
		object.polygon.off "popupclose"
		object.polygon.unbindPopup()

    # Show label
		object.showLabel "#{object.model.name()}<br />#{t('second_menu.density')}: #{density}"