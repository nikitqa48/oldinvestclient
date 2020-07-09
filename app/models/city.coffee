Model         = require 'models/model'
GeoObject     = require 'lib/geo-object'
ImageHelper   = require 'lib/image-helper'
SearchString  = require 'lib/search-string'

class City extends Model
  point: GeoObject.point
  logo: ImageHelper.logo
  pictures: ImageHelper.pictures
  searchInit: SearchString.initialize
  
  initialize: =>
    @searchInit()

module.exports = City