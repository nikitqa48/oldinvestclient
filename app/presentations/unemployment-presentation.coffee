Mediator 			= require "mediator"
Presentation 	= require "presentations/base/presentation"

module.exports = class PopulationPresentation extends Presentation
	style:
		weight: 1
		color: '#fff'
		fillOpacity: 1

	setStyle: (object) =>
		object.activeStyle  = {weight: 3} # when polygon is selected
		object.defaultStyle = {weight: 1} # when polygon is not selected

		unemployed = object.model.get "number_of_unemployed"
		fillColor = switch
			when unemployed < 300  then "#CAEDC5"
			when unemployed < 400  then "#96ED89"
			when unemployed < 500  then "#45BF55"
			when unemployed < 1000 then "#168039"
			when unemployed < 2000 then "#044D29"
			when unemployed >= 2000 then "#00261C"
			
		@style["fillColor"] = fillColor
		object.polygon.setStyle @style