PixelMob.VideoThumbnailComponent = Ember.Component.extend
    actions:
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
