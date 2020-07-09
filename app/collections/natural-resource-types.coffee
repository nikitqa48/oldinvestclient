NaturalResourceType = require 'models/natural-resource-type'
DirectoryItems = require 'collections/directory-items'

module.exports = class NaturalResourceTypes extends DirectoryItems
  model: NaturalResourceType
