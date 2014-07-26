PixelMob.ChannelRoute = Ember.Route.extend
  model: (params,queryParams) ->
    PixelMob.Channel.find(params.channel_id)
  setupController: (controller, model) ->
    @controllerFor("channel").set "content", model
    console.log model.get("name")
