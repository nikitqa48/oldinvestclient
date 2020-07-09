Filter = require 'models/filter'

module.exports = class InfoLayersFilter extends Filter
  defaults:
    selected: []#"TransformerStation"] #GasMain"]
    name: "infraLayer"

  match: (obj)=>
    return yes unless obj.isInfraLayer
    _(@get("selected")).include obj.className()

  setSelected: (el)=>
    arr = @.get("selected")
    arr.push el
    @set "selected", arr
    @trigger "change"

  unsetSelected: (el)=>
    old = @.get("selected")
    index = old.indexOf el
    old.splice index, 1
    @set "selected", old
    @trigger "change"


  toggleSelection: (el)=>
    if @isSelected el
      @unsetSelected el
    else
      @setSelected el

  isSelected: (el)=>
    _(@get("selected")).include el