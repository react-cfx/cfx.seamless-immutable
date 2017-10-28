import 'shelljs/make'
import dd from 'ddeyes'
import SI from '../dist/bundle'
# import SI from '../src'

target.all = ->

  nsi = SI.new [1, 2, 3]

  dd nsi

  try
    nsi.push 4
  catch ex
    error ex

  target.arrayPush nsi
  target.arraySet nsi
  target.arrayRemove nsi
  target.arrayRemoveItem nsi
  target.eachAsMutable nsi

target.arrayPush = (nsi) ->

  _nsi = SI.Array.push nsi
  , 4

  dd _nsi

  _nsi = SI.Array.push nsi
  , [4, 5]

  dd _nsi

  _nsi = SI.Array.push nsi
  , 4, 5

  dd _nsi

target.arraySet = (nsi) ->

  _nsi = SI.Array.set nsi
  , 1, 4

  dd _nsi

  _nsi = SI.Array.set nsi
  , 1, [ 4, 5 ]

  dd _nsi

  _nsi = SI.Array.set nsi
  , 1, 4, 5, 6

  dd _nsi

target.arrayRemove = (nsi) ->

  _nsi = SI.Array.remove nsi
  , 1

  dd _nsi

target.arrayRemoveItem = (nsi) ->

  _nsi = SI.Array.removeItem nsi
  , 1

  dd _nsi

target.eachAsMutable = (nsi) ->
  nsi = [
    nsi
    nsi
  ]

  dd nsi

  try
    nsi[0].push 4
  catch ex
    error ex

  _nsi = SI.Array.eachAsMutable nsi

  _nsi[0].push 4

  dd _nsi
