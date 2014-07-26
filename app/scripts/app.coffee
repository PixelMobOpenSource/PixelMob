#exports = this
window.PixelMob = Ember.Application.create()
require('scripts/controllers/*')
require('scripts/store')
require('scripts/models/*')
require('scripts/routes/*')
require('scripts/views/*')
require('scripts/components/*')
require('scripts/router')
require('scripts/select2.coffee')
PixelMob.SetToken = (t) ->
  $.ajaxSetup beforeSend: (xhr) ->
    xhr.setRequestHeader "X-CSRF-Token", t if t
PixelMob.Alert = (t,m,type) ->
  $('.container').prepend( """
    <div id="flash">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <strong>#{t}: </strong>#{m}
    </div>
  """)
  switch type
    when 'Warning'
      $('#flash').attr('class','alert-warning')
    when 'Error'
      $('#flash').attr('class','alert alert-danger')
    when 'Success'
      $('#flash').attr('class','alert alert-success')
    when 'Info'
      $('#flash').attr('class','alert alert-info')
PixelMob.CloseAlert = ->
  $('#flash').remove()
PixelMob.ReloadUser = (callback) ->
  t = @
  $.get "/api/user/current_user", ((data) ->
    #$('#nav').children('.hiddenDefaultElem').hide()
    #$('#nav').children('.showenDefaultElem').show()
    unless data == null
      user = PixelMob.User.find(data.user.id)
      PixelMob.current_user = user
      PixelMob.__container__.lookup('controller:currentUser').set("content", user)
      PixelMob.__container__.lookup('controller:application').set('force',Math.random())
    else
      PixelMob.current_user = null
      PixelMob.__container__.lookup('controller:currentUser').set("content", null)
      PixelMob.__container__.lookup('controller:application').set('force',Math.random())
    if callback
      callback()
  ), "json"

Ember.Application.initializer
  name: "currentUser"
  initialize: (container) ->
    PixelMob.ReloadUser()
    $.get '/api', ((data) ->
      token = data
      $.ajaxSetup beforeSend: (xhr) ->
        xhr.setRequestHeader "X-CSRF-Token", data.split('\n')[0]
    ), "text"
Ember.LinkView.reopen
  attributeBindings: ['data-toggle']
String::trunc = String::trunc or (n) ->
  (if @length > n then @substr(0, n - 1) + "&hellip;" else this)
Array::average = () ->
  s = 0
  for elem in @
    s += elem
  return s / @length
(->

  ###
  Decimal adjustment of a number.

  @param  {String}  type  The type of adjustment.
  @param  {Number}  value   The number.
  @param  {Integer}   exp   The exponent (the 10 logarithm of the adjustment base).
  @returns  {Number}      The adjusted value.
  ###
  decimalAdjust = (type, value, exp) ->

    # If the exp is undefined or zero...
    return Math[type](value)  if typeof exp is "undefined" or +exp is 0
    value = +value
    exp = +exp

    # If the value is not a number or the exp is not an integer...
    return NaN  if isNaN(value) or not (typeof exp is "number" and exp % 1 is 0)

    # Shift
    value = value.toString().split("e")
    value = Math[type](+(value[0] + "e" + ((if value[1] then (+value[1] - exp) else -exp))))

    # Shift back
    value = value.toString().split("e")
    +(value[0] + "e" + ((if value[1] then (+value[1] + exp) else exp)))

  # Decimal round
  unless Math.round10
    Math.round10 = (value, exp) ->
      decimalAdjust "round", value, exp

  # Decimal floor
  unless Math.floor10
    Math.floor10 = (value, exp) ->
      decimalAdjust "floor", value, exp

  # Decimal ceil
  unless Math.ceil10
    Math.ceil10 = (value, exp) ->
      decimalAdjust "ceil", value, exp
  return
)()
