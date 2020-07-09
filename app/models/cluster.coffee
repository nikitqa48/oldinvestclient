Model         = require 'models/model'
GeoObject     = require 'lib/geo-object'
ImageHelper   = require 'lib/image-helper'
SearchString  = require 'lib/search-string'

module.exports = class Cluster extends Model
  logo: ImageHelper.logo
  point: GeoObject.point
  points: GeoObject.points
  pictures: ImageHelper.pictures
  searchInit: SearchString.initialize

  initialize: =>
    @searchInit()
    @belongsTo "clusterType",
      collection: ->
        data.directories.clusterTypes

    @belongsTo "municipality",
      primaryKey: "dbId"
      foreignKey: "municipality_id"