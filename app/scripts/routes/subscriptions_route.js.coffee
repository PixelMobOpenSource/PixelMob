PixelMob.SubscriptionsRoute = Ember.Route.extend
    page: 0
    model: (params)->
        console.log(params)
        return    PixelMob.Video.findQuery({page: params.page, subscriptions: true})
    setupController: (controller, model) ->
        @controllerFor("subscriptions").set "content", model
    actions:
            queryParamsDidChange: ->
                @controllerFor('subscriptions').set "content", PixelMob.Video.findQuery({page: @controllerFor('subscriptions').get "page", subscriptions: true})
