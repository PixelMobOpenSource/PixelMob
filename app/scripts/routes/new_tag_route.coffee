PixelMob.NewTagRoute = Ember.Route.extend
  model: ->
    return PixelMob.Tag.create()
  actions:
    save: (controller) ->
      tag = controller.get("content")
      tagPromise = tag.save()
      tagPromise.then(
        ->
          PixelMob.Alert("Success","You succesfully created a new tag","Success")
        ,
        ->
          PixelMob.Alert("Error","You didn't succesfully created a new tag","Warning")
        )
