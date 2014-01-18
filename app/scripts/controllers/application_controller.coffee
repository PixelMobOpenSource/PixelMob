PixelMob.ApplicationController = Ember.Controller.extend(
    needs: ["currentUser"]
    queryParams: ["navSlide"]
    force: null
    actions:
        upVote: (video) ->
            console.log(video.get('id'))
            $.ajax(
                url: "/videos/#{video.get('id')}/upVote"
                type: "POST"
                dataType: "json"
            )
)
