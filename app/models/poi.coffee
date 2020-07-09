Model         = require 'models/model'
GeoObject     = require 'lib/geo-object'
ImageHelper   = require 'lib/image-helper'
SearchString  = require 'lib/search-string'

module.exports = class POI extends Model
  point: GeoObject.point
  logo: =>
    window.config.imageHost + "/" + @get("logo")
  searchInit: SearchString.initialize
  
  initialize: =>
    @searchInit()