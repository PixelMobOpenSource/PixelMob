PixelMob.VideoSearchController = Ember.ArrayController.extend
    needs: ['currentUser']
    queryParams: ['search','page']
    pageInfo: {}
    actions:
        sort: (e) ->
            console.log(e)
            @set('sortProperties',[e])
        toggleAcending: ->
            if @get('sortAscending')
                @set('sortAscending',false)
            else
                @set('sortAscending',true)
        upVote: (video) ->
            console.log(video.get('id'))
            $.ajax(
                url: "/api/videos/#{video.get('id')}/upVote"
                type: "POST"
                dataType: "json"
            ).done ->
                video.reload()
        downVote: (video) ->
            $.ajax(
                url: "/api/videos/#{video.get('id')}/downVote"
                type: "POST"
                dataType: "json"
            ).done ->
                video.reload()
