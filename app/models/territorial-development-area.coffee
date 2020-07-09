GeoObject = require 'lib/geo-object'
Model = require 'models/model'
SearchString = require 'lib/search-string'
ImageHelper = require 'lib/image-helper'
RelationHelper = require 'lib/relation-helper'

module.exports = class TerritorialDevelopmentArea extends Model
  logo: ImageHelper.logo
  point: GeoObject.point
  points: GeoObject.points
  pictures: ImageHelper.pictures
  belongsTo: RelationHelper.belongsTo
  searchInit: SearchString.initialize

  initialize: =>
    @searchInit()