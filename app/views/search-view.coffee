View                  = require "views/view"
template              = require "views/templates/search"
Mediator              = require "mediator"

class SearchView extends View
  autoRender: true
  id: "search"
  template: template
  region: "search"

  afterRender: =>
    # @searchBtn = @$ ".search-btn"
    @searchInput = @$ ".search-input input"
    @clearBtn = @$ ".search-input .close-btn"
    @searchInput.bind "keyup", @search
    @searchInput.bind "focus", _.debounce =>
      @open()
    , 300

    @clearBtn.bind "mclick", @close
    @searchFilter = window.searchRaker.getFilter("search")

  open: (callback) =>
    Mediator.publish "!router:route", "/#" #for close card
    Mediator.publish "raker:store", "main"
    Mediator.publish "raker:set", "main", window.searchRaker
    @$el.toggleClass "in-search", true
    super callback

  close: (callback) =>
    @$el.toggleClass "in-search", false
    @searchInput.val ''
    @searchFilter.set {str: ''}
    Mediator.publish "raker:restore", "main"
    $("#items-list").hide 0
    super callback

  search: =>
    @queryStr = @searchInput.val()
    @searchFilter.set {str: @queryStr}

module.exports = SearchView