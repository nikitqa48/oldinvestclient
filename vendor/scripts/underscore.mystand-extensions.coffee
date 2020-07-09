(->
  mystand =
    defered: (f) ->
      ->
        args = arguments
        setTimeout =>
          f.apply @, args
        , 0
  _.mixin mystand
)()
