Model         = require 'models/model'
GeoObject     = require 'lib/geo-object'
ImageHelper   = require 'lib/image-helper'
SearchString  = require 'lib/search-string'

class SpecialEconomicZone extends Model
  points: GeoObject.points
  point: GeoObject.point
  logo: ImageHelper.logo
  pictures: ImageHelper.pictures
  searchInit: SearchString.initialize
  initialize: =>
    @searchInit()
    @belongsTo "specialEconomicZoneType",
      collection: ->
        data.directories.specialEconomicZoneTypes

    @belongsTo "municipality",
      primaryKey: "dbId"
      foreignKey: "municipality_id"

module.exports = SpecialEconomicZone