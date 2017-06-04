import SI from  'seamless-immutable'
import isEqual from 'is-equal'

export default

  new: SI

  Array:
    push: (siArray, pushData...) ->
      return unless pushData
      siArray.concat.apply siArray, pushData

    set: (siArray, setIndex, setData...) ->
      siArray.flatMap (item, index) ->
        return item unless index is setIndex
        setData

    remove: (siArray, removeIndex) ->
      return siArray unless typeof removeIndex is 'number'
      siArray.flatMap (item, index) ->
        return item unless index is removeIndex
        []

    removeItem: (siArray, rItem) ->
      siArray.flatMap (item, index) ->
        return item unless isEqual item, SI rItem
        []

    eachAsMutable: (siArray, itemHandler) ->
      r = []
      for siObject in siArray
        siObject = itemHandler siObject if itemHandler
        r.push siObject.asMutable()
      r
