Model = require 'models/model'
GeoObject = require 'lib/geo-object'
ImageHelper = require 'lib/image-helper'
SearchString = require 'lib/search-string'
RelationHelper = require 'lib/relation-helper'

module.exports = class IndustrialPark extends Model
  logo: ImageHelper.logo
  point: GeoObject.point
  points: GeoObject.points
  pictures: ImageHelper.pictures
  searchInit: SearchString.initialize
  belongsTo: RelationHelper.belongsTo

  initialize: =>
    @searchInit()
    @belongsTo "landCategory"
    @belongsTo "company", primaryKey: "id"
    @belongsTo "stage", primaryKey: "id"