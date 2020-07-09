Collection = require 'collections/collection'

FilterViewFactory = 
  build: (model)->
    klass = require "views/filters/#{_.str.dasherize(model.className()).substr(1)}-view"
    if klass
      new klass
        model: model

module.exports = FilterViewFactory