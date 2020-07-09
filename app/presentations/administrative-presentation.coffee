Mediator 			= require "mediator"
Presentation 	= require "presentations/base/presentation"

module.exports = class AdministrativePresentation extends Presentation
	style:
		weight: 1
		color: '#fff'
		fillOpacity: 1

	setStyle: (object) =>
		super
		
		object.activeStyle  = {weight: 3} # when polygon is selected
		object.defaultStyle = {weight: 1} # when polygon is not selected

		code = object.model.get "code"
		fillColor = switch
			when code == "1" then "#E83C3A"
			when code == "2" then "#8FCDF1"
			when code == "3" then "#77BD45"
			when code == "4" then "#F2E074"
			when code == "5" then "#EC603A"
			when code == "6" then "#8A5489"
			when code == "7" then "#DF553E"
			when code == "8" then "#DB8B30"
			when code == "9" then "#FF97AB"
			when code == "10" then "#FF0011"
			when code == "11" then "#004072"

		@style["fillColor"] = fillColor
		object.polygon.setStyle @style