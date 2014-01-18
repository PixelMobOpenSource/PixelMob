PixelMob.ApplicationRoute = Ember.Route.extend
    actions:
        search: (event,router)->
            video = PixelMob.Video.find({search: event})
            video.set('search',event)
            @transitionTo('video_search',{queryParams: {page: 1, search: event}})
