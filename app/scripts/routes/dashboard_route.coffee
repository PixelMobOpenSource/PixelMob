PixelMob.DashboardRoute = Ember.Route.extend
  model: (params) ->
    PixelMob.Channel.findQuery({id: params.channel_id})
  setupController: (controller, model) ->
    @controllerFor("dashboard").set "content", model
  redirect: ->
    $.get '/api/user/current_user', (data) =>
      if data == null
        @transitionTo('signin')
