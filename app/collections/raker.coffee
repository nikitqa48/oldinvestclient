Filter = require 'models/filter'
Collection = require 'collections/collection'

module.exports = class Raker extends Collection
  model: Filter

  constructor: (source, models, options) ->
    # use only needed models
    neededModels = _(models).filter (model) => model.isNeeded source
    
    super neededModels, options
    @key = options?.key
    @source = if _(source).isArray() then source else source.models
    @data = new Collection
    @on "change", @use
    @use()

  use: =>
    @data.set (@reduce ((data, filter) -> filter.use data), @source)

  getFilter: (name) =>
    @where(name: name)[0]