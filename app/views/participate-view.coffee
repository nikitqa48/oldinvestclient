View = require "views/view"
template = require "views/templates/participate"

class ParticipateView extends View
  autoRender: true
  id: "participate"
  template: template
  region: "modal"

  afterRender: =>
    @controlGroups = @$ ".control-group"
    @inputs = @$ ".control-group input, textarea"
    @closeBtn = @$ ".close-btn"
    @overlay = @$ ".modal-overlay"
    @submit = @$ ".submit"
    @form = @$ "form"
    @form.validate
      onkeyup: no
      onfocusout: no
      errorPlacement: (error, element) ->
        $(element).parent(".control-group").addClass("error")
        true
    @inputs.bind "focusin", @focusIn
    @closeBtn.bind "mclick",  @close
    @overlay.bind "mclick",  @close

    @submit.bind "mclick", @send
    _.defer =>
      @inputs.first().focus()
      @open()
    , 0


  send: =>
    @controlGroups.removeClass("error")
    if @form.valid()
      url = @form.attr("action")
      method = @form.attr("method")
      $.ajax
        url: url
        type: method
        context: @
        data: @form.serialize()
        success: ->
          @$(".wrap").html $("<p class='success'></p>").html t("messages.mail.success")
        error: ->
          @$(".wrap").html $("<p class='success'></p>").html t("messages.mail.error")
  close: =>
    @.$el.addClass "dispose"
    setTimeout =>
      @dispose()
    , 100

  focusIn: (el) =>
    @input = $(el.currentTarget)
    @input.parent(".control-group").addClass("focus")
    @input.bind "focusout", @focusOut

  focusOut: =>
    @input.parent(".control-group").removeClass("focus")

module.exports = ParticipateView