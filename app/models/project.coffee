GeoObject = require 'lib/geo-object'
Model = require 'models/model'
SearchString = require 'lib/search-string'
ImageHelper = require 'lib/image-helper'
RelationHelper = require 'lib/relation-helper'

class Project extends Model
  points: GeoObject.points
  point: GeoObject.point
  searchInit: SearchString.initialize
  logo: ImageHelper.logo
  pictures: ImageHelper.pictures
  belongsTo: RelationHelper.belongsTo

  initialize: =>
    @set description: @get "goal"
    @searchInit()
    @belongsTo "company", primaryKey: "id"
    @belongsTo "projectType", primaryKey: "id"
    @belongsTo "territory"
    @belongsTo "municipality", primaryKey: "id"
    @belongsTo "economicActivity"

module.exports = Project