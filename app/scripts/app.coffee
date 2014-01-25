exports = this
exports.PixelMob = Ember.Application.create()
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
          <strong>#{t}</strong>#{m}
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
        callback
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

    ), "json"

Ember.Application.initializer
  name: "currentUser"
  initialize: (container) ->
        PixelMob.ReloadUser()
		$.get '/api', ((data) ->
			console.log data
			token = data
			$.ajaxSetup beforeSend: (xhr) ->
				  xhr.setRequestHeader "X-CSRF-Token", data.split('\n')[0]
		), "text"
Ember.LinkView.reopen
    attributeBindings: ['data-toggle']
String::trunc = String::trunc or (n) ->
  (if @length > n then @substr(0, n - 1) + "&hellip;" else this)
