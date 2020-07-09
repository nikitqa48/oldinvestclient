View = require 'views/view'
template = require 'views/templates/filters/range-filter'

#inspectStr = require 'lib/inspect'

class RangeFilterView extends View
  className: "filter range-filter"
  template: template

  getTemplateData: =>
    _.extend super,
      leftValue: @realLeft,
      rightValue: @realRight,
      title: @model.get("title"),
      currency: @model.get("currency")
      values: @model.get("values")

  beforeRender: =>
    super
    @exponent = 2;
    @realMin = @model.get "min"
    @realMax = @model.get "max"
    @allInterval = @realMax - @realMin

    @realLeft = @realMin
    @realRight = @realMax

    @realInterval = @realMax - @realMin
    @xCoof = Math.pow @realInterval, 1 / @exponent

    @localMin = @getLocal @realMin
    @localLeft = @getLocal @realLeft
    @localRight = @getLocal @realRight

    if _.isNaN @localLeft || _.isNaN @localRight || @localRight is Infinity || @localLeft is Infinity
      @$el.hide()

  afterRender: =>
    super
    @$el.addClass @model.get "name"
    @buttons = @$ ".slider-handle"
    @filledArea = @$ ".range"
    @labels = @$ ".slider-value"
    @middle = @$ ".slider"

    @pullFromModel()
    @updateLabel = _.throttle @updateLabel, 100
    setTimeout @updateLabel, 1000
    @model.bind "change", @pullFromModel

    @buttons.bind "mousedown touchstart", @buttonStartMove
    $("body").bind "mouseup touchend", @buttonStopMoving
    $("body").bind "mousemove touchmove", @buttonMoving

  buttonStartMove: (fullEvent) =>
    e = (fullEvent.originalEvent.touches || [fullEvent])[0]
    @moving = $ fullEvent.currentTarget
    @middleWidth = @middle.width()
    @lastPos = e.clientX
    @movingStartPos = @moving.position().left
    no

  buttonMoving: (e) =>
    if @moving
      if !e.originalEvent.touches && e.which == 0
        @buttonStopMoving()

      e = (e.originalEvent.touches || [e])[0]

      cssPosition = Math.max(Math.min(@movingStartPos + e.clientX - @lastPos, @middleWidth), 0);
      buttons = _(@buttons).sortBy((el) ->
        parseFloat($(el).position().left))

      left = parseFloat($(buttons[0]).position().left)
      right = parseFloat($(buttons[1]).position().left)

      @localLeft = left / @middleWidth * @allInterval + @localMin
      @localRight = right / @middleWidth * @allInterval + @localMin
      _.defer =>
        @updateLabelOnMove(left, right, cssPosition)

  updateLabelOnMove: (left, right, cssPosition)=>
    if @moving
      # TODO: +5 to margins is a cheat to avoid range lag when moving
      @filledArea.css("left", left / @middleWidth * 100 + "%").
      css("right", (1 - right / @middleWidth) * 100 + "%")
      @moving.css("left", cssPosition / @middleWidth * 100 + "%")
      @updateLabel @getReal(@localLeft), @getReal(@localRight)

  buttonStopMoving: =>
    if @moving
      @moving = no
      @pushToModel()

  pushToModel: =>
    @realLeft = @getReal @localLeft
    @realRight = @getReal @localRight
    @model.set {right: @realRight, left: @realLeft}

  pullFromModel: =>
    @realLeft = @model.get "left"
    @realRight = @model.get "right"
    @localLeft = @getLocal @realLeft
    @localRight = @getLocal @realRight
    @setButtons()

  setButtons: =>
    leftValueCss = (@localLeft - @localMin) / @allInterval * 100
    rightValueCss = (@localRight - @localMin) / @allInterval * 100

    $(@buttons[0]).css("left", leftValueCss + "%")
    $(@buttons[1]).css("left", rightValueCss + "%")
    @filledArea.css("left", leftValueCss + "%").css("right", 100 - rightValueCss + "%")
    @updateLabel()

  updateLabel: (left=@realLeft, right=@realRight)=>
    buttons = _(@buttons).sortBy((el) ->
      parseFloat($(el).position().left))

    _(buttons).each (el, i) =>
      label = $ ".slider-value", el
      value = (if (i is 0) then left else right)
      text = (if @options.valueProc then @options.valueProc(value) else parseInt(value))
      label.html(text)

  getReal: (local) =>
    Math.round(Math.pow(local / @allInterval * @xCoof, @exponent) + @realMin)

  getLocal: (real) =>
    Math.pow(parseFloat(real - @realMin), 1.0 / @exponent) / parseFloat(@xCoof) * parseFloat(@allInterval)

module.exports = RangeFilterView
