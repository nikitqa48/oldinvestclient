Company     = require 'models/company'
Collection  = require 'collections/collection'

class Companies extends Collection
    model: Company

module.exports = Companies