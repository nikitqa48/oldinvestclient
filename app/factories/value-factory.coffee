ValueFactory =
  build: (targetValue, currency, options) ->
    options = options or {}
    factor = options.factor or 1
    @targetValue = targetValue * Math.pow(10, factor) if factor

    pows =
      billion: 9
      million: 6
      thousand: 3

    result = [@targetValue, null]
    factor = options.factor or 1
    needText = options.needText or false
    _(pows).each ((pow, name) ->
      unless result[1]?
        divider = Math.pow(10, pow)
        if @targetValue >= divider
          @targetValue = @targetValue / divider
          result = [@targetValue, t("values." + name)]
    ), this
    if @balance(result[0].toFixed(factor)) > 0
      result[0] = Math.round result[0]
    else
      result[0] = parseInt(result[0])
    result.push t("currency." + currency)  if currency
    return result.join(" ")  if needText
    result

  balance: (value) ->
    value - parseInt(value)

module.exports = ValueFactory