window.routeFor = ->
  _(arguments).map (model) =>
    if _.isString(model)
      model
    else
      _(model.id).chain().dasherize().trim("-").value() if model
  .join "/"

window.urlFor = ->
  "#" + window.routeFor.apply(this, arguments)

window.imageUrl = (imagePath) ->
  return "#{config.imageHost}#{imagePath}" if imagePath
  imagePath