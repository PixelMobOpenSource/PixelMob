PixelMob.SigninRoute = Ember.Route.extend
  signedIn: (router,event) ->
    @transitionTo('subscriptions')
