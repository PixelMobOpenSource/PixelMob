PixelMob.VideoRoute = Ember.Route.extend
    model: (params) ->
        return PixelMob.Video.fetch(params.video_token)
    setupController: (controller, model) ->
        @controllerFor("video").set "content", model
    serialize: (model)->
        return {video_token: model.get('token'), video_slug: model.get('slug')}
