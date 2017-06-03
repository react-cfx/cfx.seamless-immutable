'use strict';

(function () {
  var SI, isEqual;

  SI = require('seamless-immutable');

  isEqual = require('is-equal');

  module.exports = {
    new: SI,
    Array: {
      push: function push(siArray) {
        for (var _len = arguments.length, pushData = Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++) {
          pushData[_key - 1] = arguments[_key];
        }

        if (!pushData) {
          return;
        }
        return siArray.concat.apply(siArray, pushData);
      },
      set: function set(siArray, setIndex) {
        for (var _len2 = arguments.length, setData = Array(_len2 > 2 ? _len2 - 2 : 0), _key2 = 2; _key2 < _len2; _key2++) {
          setData[_key2 - 2] = arguments[_key2];
        }

        return siArray.flatMap(function (item, index) {
          if (index !== setIndex) {
            return item;
          }
          return setData;
        });
      },
      remove: function remove(siArray, removeIndex) {
        if (typeof removeIndex !== 'number') {
          return siArray;
        }
        return siArray.flatMap(function (item, index) {
          if (index !== removeIndex) {
            return item;
          }
          return [];
        });
      },
      removeItem: function removeItem(siArray, rItem) {
        return siArray.flatMap(function (item, index) {
          if (!isEqual(item, SI(rItem))) {
            return item;
          }
          return [];
        });
      },
      eachAsMutable: function eachAsMutable(siArray, itemHandler) {
        var i, len, r, siObject;
        r = [];
        for (i = 0, len = siArray.length; i < len; i++) {
          siObject = siArray[i];
          if (itemHandler) {
            siObject = itemHandler(siObject);
          }
          r.push(siObject.asMutable());
        }
        return r;
      }
    }
  };
}).call(undefined);

