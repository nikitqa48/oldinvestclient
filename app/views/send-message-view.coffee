View = require "views/view"
template = require "views/templates/send-message"

class SendMessageView extends View
  autoRender: true
  id: "send-message"
  template: template
  region: "modal"

  getTemplateData: =>
    _.extend super,
      messageBody: """
        #{t("messages.mail.object_request")} <a href="#{config.host + '/' + location.hash}">#{@model.get("name")}</a>
      """

  afterRender: =>
    @controlGroups = @$ ".control-group"
    @inputs = @$ ".control-group input"
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
    @closeBtn.bind "mclick", @close
    @overlay.bind "mclick", @close

    @submit.bind "mclick", @send
    setTimeout =>
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
        data: @form.serialize() + "&subject=#{t("messages.mail.subject")}"
        complete: ->
        success: ->
          @$(".wrap").html $("<p class='success'></p>").html(t("messages.mail.info_success"))
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


module.exports = SendMessageView