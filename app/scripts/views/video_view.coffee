PixelMob.VideoView = Ember.View.extend
    sizeWidth: 640
    sizeHeight: 360
    player: null
    currentRes: null
    actions:
        unsubscribe: ->
            id = @get('controller').get('content').get('channel').get('id')
            $.ajax
                url: '/api/user/unsubscribe/' + id
                type: "POST"
            $("#subscribeButton").removeClass("btn-danger")
            $("#subscribeButton").addClass("btn-primary")
            $("#subscribeButton").text("Subscribe")
            PixelMob.__container__.lookup('controller:subscriptions').set('force',Math.random())
            PixelMob.__container__.lookup('controller:subscriptions').set('force',Math.random())
            PixelMob.current_user.get('subscriptions').pushObject(@get('controller').get('content').get('channel'))
            @get('controller').get('content').get('channel').reload()
            PixelMob.current_user.reload()
        subscribe: ->
            id = @get('controller').get('content').get('channel').get('id')
            $.ajax
                url: '/api/user/subscribe/' + id
                type: "POST"
            $("#subscribeButton").removeClass("btn-primary")
            $("#subscribeButton").addClass("btn-danger")
            $("#subscribeButton").text("Unsubscribe")
            PixelMob.__container__.lookup('controller:subscriptions').set('force',Math.random())
            @get('controller').get('content').get('channel').reload()
            @get('controller').get('content').reload()
            PixelMob.current_user.reload()
        large: ->
            @player.dimensions(1024, 576)
        small: ->
            @player.dimensions(640, 360)
    willDestroyElement: ->
        videojs.ControlBar.prototype.options_.children.resolutionsButton = false
        @get('player').dispose()
        console.log(@get('player'))
        clone = this.$().clone()
        this.$().replaceWith(clone)
        clone.slideUp(500, "easeInOutQuad")
    didInsertElement: ->
        this.$().slideUp(0);
        this.$().slideDown(500);
        videojs.players = {} # This may be changed so me in the future check here for bugs. The reason this is used is becuase videojs minify process makes the players varible mini
        video = @get('controller').get('content')
        t = @
        console.log(video.get('id'))
        techOrder = ["html5","flash"]
        defaultSrc = video.get('file')['file']['sd']['url'];
        if video.get('vast')
            ads = []
            $(video.get('vast')).find("Ad").each (ai) ->
                id = $(this).attr("id")
                ads[ai] = {}
                ads[ai]["Id"] = id
                $(this).find("InLine").each ->
                    ads[ai]["AdSystem"] = $(this).find("AdSystem").text()
                    ads[ai]["AdTitle"] = $(this).find("AdTitle").text()
                    ads[ai]["Description"] = $(this).find("Description").text()
                    ads[ai]["Impression"] = $(this).find("Impression").text()
                    ads[ai]["Creatives"] = []
                    $(this).find("Creatives").find("Creative").each (i) ->
                        ads[ai]["Creatives"][i] = {}
                        ads[ai]["Creatives"][i]["AdID"] = $(this).attr("AdID")
                        ads[ai]["Creatives"][i]["CompanionAds"] = [];
                        $(this).find("CompanionAds").find("Companion").each (ii) ->
                            ads[ai]["Creatives"][i]["CompanionAds"][ii] = {}
                            ads[ai]["Creatives"][i]["CompanionAds"][ii]["width"] = $(this).attr("width")
                            ads[ai]["Creatives"][i]["CompanionAds"][ii]["height"] = $(this).attr("height")
                            ads[ai]["Creatives"][i]["CompanionAds"][ii]["StaticResource"] = {}
                            ads[ai]["Creatives"][i]["CompanionAds"][ii]["StaticResource"]["creativeType"] = $(this).attr("creativeType")
                            ads[ai]["Creatives"][i]["CompanionAds"][ii]["StaticResource"]["url"] = $(this).text().split('\n')[2]
                            ads[ai]["Creatives"][i]["CompanionAds"][ii]["TrackingEvents"] = []
                            ads[ai]["Creatives"][i]["CompanionAds"][ii]["CompanionClickThrough"] = $(this).find("CompanionClickThrough").text()
                            $(this).find("TrackingEvents").find("Tracking").each (iii) ->
                                ads[ai]["Creatives"][i]["CompanionAds"][ii]["TrackingEvents"][iii] = {}
                                ads[ai]["Creatives"][i]["CompanionAds"][ii]["TrackingEvents"][iii]["event"] = $(this).attr("event")
                                ads[ai]["Creatives"][i]["CompanionAds"][ii]["TrackingEvents"][iii]["url"] = $(this).text()
                        $(this).find("Linear").each ->
                            ads[ai]["Creatives"][i]["Duration"] = $(this).find("duration").text()
                            ads[ai]["Creatives"][i]["TrackingEvents"] = []
                            ads[ai]["Creatives"][i]["VideoClicks"] = {}
                            ads[ai]["Creatives"][i]["MediaFiles"] = []
                            ads[ai]["Creatives"][i]["CompanionAds"] = []
                            $(this).find("TrackingEvents").find("Tracking").each (ii) ->
                                ads[ai]["Creatives"][i]["TrackingEvents"][ii] = {}
                                ads[ai]["Creatives"][i]["TrackingEvents"][ii]["event"] = $(this).attr("event")
                                ads[ai]["Creatives"][i]["TrackingEvents"][ii]["url"] = $(this).text()

                            $(this).find("VideoClicks").children().each (ii, tag) ->
                                ads[ai]["Creatives"][i]["VideoClicks"][tag] = $(this).text()

                            $(this).find("MediaFiles").find("MediaFile").each (ii) ->
                                ads[ai]["Creatives"][i]["MediaFiles"][ii] = {}
                                ads[ai]["Creatives"][i]["MediaFiles"][ii]["Delivery"] = $(this).attr("delivery")
                                ads[ai]["Creatives"][i]["MediaFiles"][ii]["type"] = $(this).attr("type").replace('x-','')
                                ads[ai]["Creatives"][i]["MediaFiles"][ii]["bitrate"] = $(this).attr("bitrate")
                                ads[ai]["Creatives"][i]["MediaFiles"][ii]["width"] = $(this).attr("width")
                                ads[ai]["Creatives"][i]["MediaFiles"][ii]["height"] = $(this).attr("height")
                                ads[ai]["Creatives"][i]["MediaFiles"][ii]["scalable"] = $(this).attr("scalable")
                                ads[ai]["Creatives"][i]["MediaFiles"][ii]["maintainAspectRatio"] = $(this).attr("maintainAspectRatio")
                                ads[ai]["Creatives"][i]["MediaFiles"][ii]["url"] = $(this).text()
                ad = ads[0]
                creative = ad["Creatives"][0]
                companionAd = ad["Creatives"][1]["CompanionAds"][0]
                mediaFiles = creative["MediaFiles"]
                mediaFile = mediaFiles[0]
                $('#companionAd1').attr('src',companionAd["StaticResource"]["url"])
                if(mediaFile["type"] == "video/flv")
                    techOrder = ["flash","html5"]
                console.log(techOrder)
        player = videojs(video.get('id'), {techOrder: techOrder, plugins: {
            resolutions: true,
            'chromecast': {enabled: true, appId: 'pixelmob', 'co.pixelmob.video', title: 'PixelMob', description: 'The #1 source for Lets Plays'}
            } }, ->
            t.player = @
            watched = false
            aspectRatio = 9/16
            resizeVideoJS = () ->
                width = document.getElementById(t.player.id()).parentElement.offsetWidth
                t.player.width(width).height( width * aspectRatio )
            resizeVideoJS()
            window.onresize = resizeVideoJS

            if video.get('vast')
                ad = ads[0]
                creative = ad["Creatives"][0]
                mediaFiles = creative["MediaFiles"]
                mediaFile = mediaFiles[0]
                t.player.src(mediaFile["url"])
                t.player.on 'ended', ->
                    t.player.src(defaultSrc)
            @on("timeupdate", ->
                console.log "Duration:" + @duration()
                console.log "Current Time:" + @currentTime()
                console.log    @currentTime() / @duration()
                if(watched == false &&    @currentTime() / @duration()    >= .80)
                    watched = true
                    $.ajax(
                        type: "POST"
                        url: "/api/videos/watch"
                        dataType: "ajax"
                        data:
                            time: @currentTime()
                            duration: @duration()
                            id: t.get('controller').get('content').get('id')
                    ).done ->
                        watched = true
                        console.log "Watched"
            )
        )
        @set('player',player)
        console.log(@get('player'))
    changeSrc: (c) ->
        t = @player.currentTime()
        @player.src(c)
        @player.on 'ready',

        @player.currentTime(t)
PixelMob.SubscribeButtonView = Ember.View.extend
    click: ->
        if(@get('controller').get('content').get('channel').get('subscribed'))
            id = @get('controller').get('content').get('channel').get('id')
            $.ajax
                url: '/api/user/unsubscribe/' + id
                type: "POST"
            $("#subscribeButton").removeClass("btn-danger")
            $("#subscribeButton").addClass("btn-primary")
            $("#subscribeButton").text("Subscribe")
            PixelMob.__container__.lookup('controller:subscriptions').set('force',Math.random())
            PixelMob.__container__.lookup('controller:subscriptions').set('force',Math.random())
            PixelMob.current_user.get('subscriptions').pushObject(@get('controller').get('content').get('channel'))
            @get('controller').get('content').get('channel').reload()
            PixelMob.current_user.reload()
        else
            id = @get('controller').get('content').get('channel').get('id')
            $.ajax
                url: '/api/user/subscribe/' + id
                type: "POST"
            $("#subscribeButton").removeClass("btn-primary")
            $("#subscribeButton").addClass("btn-danger")
            $("#subscribeButton").text("Unsubscribe")
            PixelMob.__container__.lookup('controller:subscriptions').set('force',Math.random())
            PixelMob.current_user.get('subscriptions').pushObject(@get('controller').get('content').get('channel'))
            @get('controller').get('content').get('channel').reload()
            PixelMob.current_user.reload()
PixelMob.CommentView = Ember.View.extend
    comment: null
    newComment: ->
        cForm = "<div>"
        cForm += "<fieldset>"
        if @get('comment')
            cForm += "<textarea style='width:550px;height:250px;' class='newComment" +    @get('comment').get('id') + "'></textarea>"
            cForm += "<br/>"
            cForm += "<button class='btn-primary btn' id='" + @get('comment').get('id')    + "'>Comment</button>"
            this.$().append cForm
            $('.newComment'+ @get('comment').get('id')).ckeditor()
            $("#" + @get('comment').get('id')+'.btn').click =>
                console.log $('.newComment#' + @get('comment').get('id')).val()
                comment = PixelMob.Comment.create
                    content: $('.newComment' + @get('comment').get('id')).val()
                    parent_comment: PixelMob.Comment.find(@get('comment').get('id'))
                    video: @get('controller').get('content')
                    user: PixelMob.current_user
                comment.save()
                @get('controller').get('content').get('comments').reload()
                comment.reload()
        else
            cForm += "<textarea style='width:550px;height:250px;' class='newCommentFirst'></textarea>"
            cForm += "<br/>"
            cForm += "<button class='btn-primary btn' id='submitButton'>Comment</button>"
            this.$().append cForm
            $('.newCommentFirst').ckeditor()
            $("#submitButton.btn" ).click =>
                comment = PixelMob.Comment.create
                    content: $('.newCommentFirst' ).val()
                    video: @get('controller').get('content')
                    user: PixelMob.current_user
                comment.save()
                @get('controller').get('content').get('comments').reload()
