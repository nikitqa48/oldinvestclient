PageFragment     = require 'models/page-fragment'
Collection  = require 'collections/collection'

class PageFragments extends Collection
  model: PageFragment

module.exports = PageFragments