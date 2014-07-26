PixelMob.TagRoute = Ember.Route.extend
  model: (params) ->
    PixelMob.Tag.find(params.tag_id)
