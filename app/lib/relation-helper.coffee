# Mix in non-conflict functions to Underscore namespace
_.mixin _.str.exports()

RelationHelper =
  belongsTo: (field, opts) ->
    options = _.extend(
      primaryKey: "code"
    , opts or {})
    methodName = _(field).camelize()
    this[methodName] = =>
      foreignKey = options.foreignKey or (_(field).underscored() + "_" + options.primaryKey)
      code = @get foreignKey
      unless code is `undefined`
        model = _(field).chain().pluralize().camelize().value()
        if options.primaryKey == "id" then key = "dbId" else key = options.primaryKey
        condition = {}
        condition[key] = code
        obj = try data.directories[model].findWhere(condition)
        return obj unless _(obj).isEmpty()
        try data[model].findWhere(condition)

    
  hasMany: (field, opts) ->
    options = _.extend(
      primaryKey: "code"
    , opts or {})
    methodName = _(field).camelize()
    if options.primaryKey is "id" then options.primaryKey = "dbId"
    this[methodName] = =>
      primaryKey = @get options.primaryKey
      unless primaryKey is `undefined`
        foreignKey = options.foreignKey or (_(@type()).underscored() + "_" + options.primaryKey)
        window[methodName].findBy foreignKey, primaryKey
    
module.exports = RelationHelper