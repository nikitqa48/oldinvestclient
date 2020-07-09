Model           = require 'models/model'
GeoObject       = require 'lib/geo-object'
ImageHelper     = require 'lib/image-helper'
SearchString    = require 'lib/search-string'
RelationHelper  = require 'lib/relation-helper'

class NaturalResource extends Model
  point: GeoObject.point
  logo: ImageHelper.logo
  pictures: ImageHelper.pictures
  searchInit: SearchString.initialize
  belongsTo: RelationHelper.belongsTo  

  initialize: =>
    @belongsTo "natural_resource_type"
    @set name: @name()
    @searchInit ["name", "description"]

  name: =>
    name = @get "name"
    ret = if name then name else
      type = @naturalResourceType()
      type.get "name" if type

module.exports = NaturalResource