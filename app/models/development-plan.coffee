Model         = require 'models/model'
GeoObject     = require 'lib/geo-object'

class DevelopmentPlan extends Model
  point: GeoObject.point
module.exports = DevelopmentPlan