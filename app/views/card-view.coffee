View = require "views/view"
Mediator = require "mediator"
template = require "views/templates/card"
PrintView = require "views/print-view"
ValueFactory = require "factories/value-factory"
CardDataView = require "views/card-data-view"
SendMessageView = require "views/send-message-view"
CardDescriptionView = require "views/card-description-view"

class CardView extends View
  autoRender: yes
  className: "card"
  template: template
  region: "card"
  regions:
    cardData: "#card-data-container"
    cardDescription: "#card-description-container"

  getTemplateData: =>
    modelClassName = @model.className()
    fileName = _(modelClassName).dasherize().substr 1
    way = "views/templates/card/#{fileName}"
    defaultWay = "views/templates/card/default"

    partial = try
      require way
    catch _error
      require defaultWay

    _.extend super,
      renderPartial: partial
      parseMoney: $.proxy ValueFactory.build, ValueFactory

  afterRender: =>
    @backBtn = @$ ".actions .back"
    @backBtn.bind "click", ->
      Mediator.publish "!router:route", "/#"
    @scrollContainer = @$ ".card-content"
    @scrollContainer.iScroll()

    setTimeout =>
      @open()
      @fixContent()
    , 0

    @$(".send-email").bind "mclick", =>
      new SendMessageView model: @model

    # Share buttons
    @$(".pdf-button").bind "mclick", @pdf
    @$(".print-button").bind "mclick", @print
    @$(".share-button").bind "mclick", @share

    @closeCard = @$ ".close-card"
    @closeCard.bind "mclick", =>
      Mediator.publish "!router:route", "/#"

    @subview "data", new CardDataView model: @model

    @dataBlock = @$ '.data-block'

    @galleryScroller = @$ ".gallery-scroller"
    @galleryScroller.iScroll
      scrollX: true
      scrollY: false

    tpl =
      next: '<a class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',
      prev: '<a class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'
      closeBtn: '<a class="fancybox-item fancybox-close" href="javascript:;"></a>',
    images = @$ "li a", @galleryScroller
    if images.length > 0
      images.fancybox
        tpl: tpl


    if @model.get('description')
      @subview "description", new CardDescriptionView model: @model
      @cardBtn = @$ '.card-btn'
      @cardBtn.bind 'click', (e) =>
        @dataBlock.attr 'id', $(e.currentTarget).data('target')
    else
      @dataBlock.addClass 'no-navigation'


  fixContent: =>
    cardWrap = @$ ".card-wrap"
    cardHeader = @$ ".card-header"
    cardContent = @$ ".card-content"
    cardContent.css "height", "#{cardWrap.height() - cardHeader.height()}px"
    setTimeout =>
      $(window).trigger("iscroll-refresh")
    , 300

  dispose: =>
    @close()
    $(window).unbind 'resize', @fixContent
    setTimeout =>
      super
    , 500

  # Creates PrintView with model content
  pdf: (e) =>
    defaultExcluded = ["id", "created_at", "updated_at"]
    excluded = [
      "code", "coords", "pictures", "name", "owner_id", "description", "goal", "buildings", "platform_type_code",
      "demo_mode", "area"
      "gas", "heating", "electricity", "water", "sewerage", "sewage_plants", "boiler_system", "dbId", "key"
    ]

    fields = _.omit(@model.attributes, _.union(defaultExcluded, excluded))
    attributes = _(_(fields).keys()).map((attribute) =>
      'attributes[]=' + encodeURIComponent attribute
    ).join "&"
    id = @model.get("dbId")
    collection = _.chain(@model.className()).dasherize().pluralize().value().toLowerCase().substr 1
    url = "#{config.adminHost}/#{collection}/#{id}.pdf?#{attributes}"

    pdfView = new PrintView
      model: @model
    html = pdfView.render().el
    pdfWindow = window.open url, '', 'location=no,resizable=yes'
    false

  # Creates PrintView with model content
  # and offers to print it
  print: (e) =>
    printView = new PrintView
      model: @model
    html = printView.render().el

    printWindow = window.open '', '', 'location=no,resizable=yes'
    printDocument = printWindow.document
    printDocument.write html.outerHTML || new XMLSerializer().serializeToString html
    #    printWindow.print()
    false

  # Open sharing window
  share: (e) =>
    target = $ e.currentTarget

    url = encodeURIComponent config.host + '/' + routeFor 'items', @model
    truncateLength = 140 - url.length
    title = encodeURIComponent _(@model.get("name")).truncate truncateLength
    description = @model.get 'description'
    description = if description then _(description).truncate truncateLength else title

    switch target.attr "action"
      when "twitter"    then shareUrl = "https://twitter.com/share?url=#{url}&text=#{title}"
      when "facebook"   then shareUrl = "http://www.facebook.com/sharer/sharer.php?s=100&p[title]=#{title}&p[summary]=#{description}&p[url]=#{url}"
      when "vkontakte"  then shareUrl = "http://vk.com/share.php?url=#{url}&title=#{title}&description=#{description}"
    if shareUrl then window.open shareUrl, '', 'width=626, height=436'
    false

module.exports = CardView