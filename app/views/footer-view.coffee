View = require "views/view"
template = require "views/templates/footer"
DesignationView = require "views/designation-view"
ChangeLocaleView = require "views/change-locale-view"
DemoModer = require "lib/demo-moder"
Mediator = require 'mediator'

class FooterView extends View
  autoRender: true
  id: "footer"
  template: template
  region: "footer"
  regions:
    designation: "#designation-container"
    changeLocale: "#change-locale-container"

  afterRender: =>
    @demoModeBtn = @$('.demo-mode-btn')
    if DemoModer
      @demoModeBtn.bind 'mclick', ->
        if DemoModer.isEnable() then DemoModer.stop() else DemoModer.start()
      Mediator.subscribe 'demo:start', =>
        @demoModeBtn.addClass 'active'
      Mediator.subscribe 'demo:stop', =>
        @demoModeBtn.removeClass 'active'
    else
      @$('#demo-mode-container').hide()
      @$('#designation-container').css 'right', '9em'
      @$('#change-locale-container').css 'width', '9em'

    @subview "designation", new DesignationView
    @subview "changeLocale", new ChangeLocaleView

    @zoomViews = @$ "#zoomViews .zoomView"
    @zoomViews.bind "mclick", @setView

  setView: (ev) =>
    target = $ ev.currentTarget
    key = target.data "key"
    @showView key

  showView: (key) =>
    switch key
      when "world" 
        window.map.fitBounds [[36.03133177633189,-58.53515625],[76.31035754301745, 166.46484375]]
      when "russia"
        window.map.fitBounds [[48.864714761802794,2.548828125],[69.3493386397765, 115.04882812499999]]
      when "lipetsk"
        window.map.fitBounds [[53.58722,40.7647752],[51.8870621,37.7217164]]
      when "administrative"
        window.map.fitBounds [[52.87078763626816,41.1273193359375],[52.25807132666112,37.6116943359375]]
      when "municipalities"
        window.map.fitBounds [[52.64223014513886,39.762611389160156],[52.565708082357574,39.323158264160156]]

module.exports = FooterView