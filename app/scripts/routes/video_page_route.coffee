PixelMob.VideoPageRoute = Ember.Route.extend
    model: ->
        console.log('test')
        return PixelMob.Video.find({page: 1})
