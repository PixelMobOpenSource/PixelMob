PixelMob.GameRoute = Ember.Route.extend
	model: (params) ->
		@store.find 'game', params.game_id
	setupController: (controller, model) ->
		@controllerFor("game").set "content", model
