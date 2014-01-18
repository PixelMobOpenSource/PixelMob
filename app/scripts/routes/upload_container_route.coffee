PixelMob.UploadContainerRoute = Ember.Route.extend
    actions:
        willTransition: (transition) ->
            if(!confirm("Are you sure you want to leave?"))
                transition.abort()
            else
                true
    redirect: ->
        $.get '/api/user/current_user', (data) =>
            if data == null
                @transitionTo('signin')
