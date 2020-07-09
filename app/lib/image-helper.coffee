ImageHelper =
  logo: (version) ->
    version = version or "small"
    if @get("pictures")
      image = @get("pictures")[0]
      if image
        if window.config.imageHost is `undefined`
          return "." + image[version]
        else
          return window.config.imageHost + image[version]
    ""

  pictures: (version) ->
    version = version or "thumb"
    pictures = @get("pictures")
    if pictures and pictures.length > 0
      gallery = _(pictures).clone()
    return _(gallery).map((picture) ->
      if window.config.imageHost is `undefined`
        "." + picture[version]
      else
        window.config.imageHost + picture[version]
    )
    []

module.exports = ImageHelper