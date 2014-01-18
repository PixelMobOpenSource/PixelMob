PixelMob.VideosRoute = Ember.Route.extend
    page: 0
    model: (params,queryParams)->
        if(queryParams.page)
            @set('page',queryParams.page)

            return PixelMob.Video.fetch({page: queryParams.page})
        else
             return    PixelMob.Video.fetch({page: 1})
    setupController: (controller, model) ->
        @controllerFor("videos").set "page", @get('page')
        @controllerFor("videos").set "pageTwo", parseInt(@get('page')) + 2
        @controllerFor("videos").set "pageOne", parseInt(@get('page')) + 1
        if(parseInt(@get('page')) > 1)
                @controllerFor("videos").set "pageMOne", parseInt(@get('page')) - 1
        else
                @controllerFor("videos").set "pageMOne", false
        if(parseInt(@get('page')) > 1)
                @controllerFor("videos").set "pageMTwo", parseInt(@get('page')) - 2
        else
                @controllerFor("videos").set "pageMTwo", false
        @controllerFor("videos").set "content", model
        @controllerFor("videos").set "lastPage", @get('lastPage')
