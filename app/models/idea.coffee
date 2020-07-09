Model         = require 'models/model'
GeoObject     = require 'lib/geo-object'
ImageHelper   = require 'lib/image-helper'
SearchString  = require 'lib/search-string'
RelationHelper = require 'lib/relation-helper'

module.exports = class Idea extends Model
  point: GeoObject.point
  logo: ImageHelper.logo
  pictures: ImageHelper.pictures
  searchInit: SearchString.initialize
  belongsTo: RelationHelper.belongsTo
  
  initialize: =>
    @belongsTo "company", {primaryKey: "id"}
    @belongsTo "economicActivity"
    @belongsTo "territory"
    @searchInit()