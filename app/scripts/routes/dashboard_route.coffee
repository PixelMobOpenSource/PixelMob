PixelMob.DashboardRoute = Ember.Route.extend
    model: (params) ->
        PixelMob.Channel.findQuery({id: params.channel_id,video_page: params.video_page})
    redirect: ->
        $.get '/api/user/current_user', (data) =>
            if data == null
                @transitionTo('signin')
