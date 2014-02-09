PixelMob.VideoSearchRoute = Ember.Route.extend
    page: 0
    search: 0
    model: (params)->
        console.logparams
        if(params["page"])
            @set('page',params.page)
            @set('search',params.search)
            return PixelMob.Video.findQuery({page: params.page, search: params.search})
        else
            @set('page',1)
            @set('search',params.search)
            return    PixelMob.Video.findQuery({page: 1, search: params.search})
    setupController: (controller, model) ->
        pageInfo = {}
        pageInfo.page = @get('page')
        $.get '/api/videos/lastpage?search=' + @get('search'), (result) =>
                unless(parseInt(@get('page')) == parseInt(result))
                        pageInfo.pageOne = parseInt(@get('page')) + 1
                else
                        pageInfo.pageOne = false
                        pageInfo.pageTwo = false
                if(parseInt(@get('page')) + 2 <= parseInt(result))
                        pageInfo.pageTwo = parseInt(@get('page')) + 2
                if(parseInt(@get('page')) > 1)
                        pageInfo.pageMOne = parseInt(@get('page')) - 1
                else
                        pageInfo.pageMOne = false
                if(parseInt(@get('page')) > 1)
                        pageInfo.pageMTwo = parseInt(@get('page')) - 2
                else
                        pageInfo.pageMTwo = false
                console.log(pageInfo)
                @controllerFor("video_search").set 'pageInfo', pageInfo
        @controllerFor("video_search").set "content", model
