PixelMob.EditVideoRoute = Ember.Route.extend
    model: (params) ->
     PixelMob.Video.find params.video_token
    setupController: (controller, model) ->
        @controllerFor("edit_video").set "content", model
    serialize: (model) ->
        return
            video_token: model.get('token')
            video_slug: model.get('slug')
