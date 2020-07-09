Controller = require "controllers/base/controller"
CardView = require "views/card-view"
Mediator = require "mediator"
BufferedMediator = require "lib/buffered-mediator"
mapready = no

module.exports = class ItemsController extends Controller
  show: (params) =>
    id = _("-#{params.id}").camelize()
    model = _(data.all).findWhere({id: id})
    @cardView = new CardView {model: model}
    BufferedMediator.publish "map:object:open", model
    Mediator.publish "menu:main:activate"
    setTimeout =>
      BufferedMediator.publish "map:object:open", model
      Mediator.publish "menu:main:activate"
    , 300

  dispose: =>
    Mediator.publish "map:object:close"
    super