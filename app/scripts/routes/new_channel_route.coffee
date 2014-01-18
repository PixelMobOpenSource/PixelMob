PixelMob.NewChannelRoute = Ember.Route.extend
    redirect: ->
        $.get '/api/user/current_user', (data) =>
            if data == null
                @transitionTo('signin')
