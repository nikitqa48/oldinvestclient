Model         = require 'models/model'
GeoObject     = require 'lib/geo-object'
ImageHelper   = require 'lib/image-helper'
SearchString  = require 'lib/search-string'
Projects = require "collections/projects"

module.exports = class Municipality extends Model
  point: GeoObject.point
  logo: ImageHelper.logo
  points: GeoObject.points
  pictures: ImageHelper.pictures
  searchInit: SearchString.initialize
  
  initialize: =>
    @searchInit()
    @hasMany "projects", primaryKey: "id"


  insiders: =>
    new Projects data.projects.filter((p)=>
      @isInsider(p.point())
    )

  printInsiders: =>
    "#{@get("dbId")} => [#{@insiders().pluck("dbId").join(", ")}]"



  isInsider: (point)=>
    vs = @points()
    x = point[0]
    y = point[1]
    inside = false
    i = 0
    j = vs.length - 1

    while i < vs.length
      xi = vs[i][0]
      yi = vs[i][1]
      xj = vs[j][0]
      yj = vs[j][1]
      intersect = ((yi > y) isnt (yj > y)) and (x < (xj - xi) * (y - yi) / (yj - yi) + xi)
      inside = not inside  if intersect
      j = i++
    inside

window.printInsiders = ->
  "{#{data.municipalities.invoke("printInsiders").join(",")}}"
