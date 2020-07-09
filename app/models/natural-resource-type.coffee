DirectoryItem = require("models/directory-item")
RelationHelper = require("lib/relation-helper")

module.exports = class NaturalResourceType extends DirectoryItem
  hasMany: RelationHelper.hasMany

  initialize: =>
    @hasMany "natural_resources"

