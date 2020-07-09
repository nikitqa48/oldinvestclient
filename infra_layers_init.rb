require "active_support/all"
def start
  infra_layers = [:central_heating_units,:heating_mains,:diesel_power_plants,:duel_fuel_power_plants, :geothermal_electricity_plants,:hydro_plants,:wind_plants,:transformer_substations,
  :electric_power_transmissions, :intakes, :water_supplies, :wastewater_treatment_plants, :sewers
  ]
	model_sample = File.read "app/models/infrastructural-objects/sample-model.coffee"
	collection_sample = File.read "app/collections/sample-collection.coffee"
	puts model_sample
	
	infra_layers.each do |il|
		create_model model_sample, il
		create_collection collection_sample, il
	end				   

end


def create_collection sample_str, name
	collection_file_name = name.to_s.dasherize
	collection_name = name.to_s.camelize
	model_name = name.to_s.singularize.camelize 
	model_file_name = name.to_s.singularize.dasherize
	
	filename = "app/collections/#{collection_file_name}.coffee" 	
	res = sample_str.gsub("sample", model_file_name).gsub("Samples", collection_name).gsub("Sample", model_name)
	File.open(filename, 'w') { |file| file.write(res) }
end

def create_model sample_str, name
	model_file_name = name.to_s.dasherize.singularize
	model_name = name.to_s.camelize.singularize
	filename = "app/models/infrastructural-objects/#{model_file_name}.coffee"
	res = sample_str.gsub "Sample", model_name
	File.open(filename, 'w') { |file| file.write(res) }
end

start


