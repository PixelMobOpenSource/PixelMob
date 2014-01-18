PixelMob.DashboardRoute = Ember.Route.extend
    model: (params,queryParams) ->
        PixelMob.Channel.find(queryParams.channel)
    redirect: ->
        $.get '/api/user/current_user', (data) =>
            if data == null
                @transitionTo('signin')
