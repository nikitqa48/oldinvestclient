module.exports = class Model extends Backbone.Model
  constructor: (data, options) ->
    if data && data.id?
      data.dbId = data.id
      data.id = @className() + data.dbId
    super data, options

  belongsTo: (name, options) =>
    keyword = "code"
    foreignKey = options.foreignKey or _.underscored(name) + "_" + keyword
    primaryKey = options.primaryKey or keyword
    cachedName = name + "Cached"
    self = @
    @[name] = ->
      if self[cachedName] is `undefined`
        collection = (if options.collection then options.collection() else data[_.pluralize(name)])
        self[cachedName] = collection.findBy(primaryKey, self.get(foreignKey))
      self[cachedName]

  hasMany: (name, options) =>
    keyword = "code"
    foreignKey = options.foreignKey
    primaryKey = options.primaryKey or keyword
    cachedName = name + "Cached"
    self = @
    @[name] = ->
      if self[cachedName] is `undefined`
        collection = (if options.collection then options.collection() else window[name])
        targetValue = self.get(primaryKey)
        @[cachedName] = new collection.constructor(collection.filter((el) ->
          el.get(foreignKey) is targetValue
        ))
      self[cachedName]

  className: =>
    return @_classNameCached if @_classNameCached
    str = @constructor.toString().match(/function (\w+)\(.*/)
    @_classNameCached = str[1] if str

  name: =>
    @get "name"

  toString: =>
    @id