PixelMob.SubscriptionsRoute = Ember.Route.extend
  page: 0
  model: (params)->
    console.log(params)
    videos = PixelMob.Video.findQuery({page: params.page, subscriptions: true})
    return videos
  setupController: (controller, model) ->
    @controllerFor("subscriptions").set "content", model
  actions:
    queryParamsDidChange: ->
      @refresh()
