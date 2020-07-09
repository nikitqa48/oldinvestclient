View = require 'views/view'
template = require 'views/templates/filters/layer-filter'
InfoLayersFilterView = require 'views/filters/info-layers-filter-view'

class LayerFilterView extends View
    template: template

    afterRender: =>
        @$el.addClass @model.get("name")
        @buttons = $ "a", @el
        @liArr = $ "li", @el
        @buttons.bind "mclick", @changeType

        infoLayersFilterView = InfoLayersFilterView.getInstance {model: window.raker.getFilter("info-layers")}
        $(@liArr.last()).after(infoLayersFilterView.render().el)
        @refresh()
        @model.bind "change", @refresh

    refresh: =>
        layer = @model.get "layer"
        @liArr.removeClass "active"
        li = $("li[data-layer=" + layer + "]", this.el)
        li.addClass("active")

    getRenderData: =>
        {layers: _(this.model.layers).keys()}

    changeType: =>
        button = $ ev.currentTarget
        layer = button.data "layer"
        @model.set {layer: layer}
        $(window).trigger("iscroll-refresh")
        false

module.exports = LayerFilterView