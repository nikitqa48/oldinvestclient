Model           = require 'models/model'
GeoObject       = require 'lib/geo-object'
ImageHelper     = require 'lib/image-helper'
SearchString    = require 'lib/search-string'
RelationHelper  = require 'lib/relation-helper'

class InfrastructuralObject extends Model
  point: GeoObject.point
  points: GeoObject.points
  logo: ImageHelper.logo
  pictures: ImageHelper.pictures
  searchInit: SearchString.initialize
  belongsTo: RelationHelper.belongsTo
  isInfraLayer: yes

  initialize: =>
    @searchInit ["name", "description"]
    @belongsTo "infrastructureType"

module.exports = InfrastructuralObject