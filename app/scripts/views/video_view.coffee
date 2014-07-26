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
    player = videojs(video.get('id'), {techOrder: techOrder, plugins: {
      resolutions: true,
      'chromecast': {enabled: true, appId: 'pixelmob', 'co.pixelmob.video', title: 'PixelMob', description: 'The #1 source for Lets Plays'}, ads: {}, vast: {url: "http://theonion.github.io/videojs-vast-plugin/onion_sample.xml"}

      } }, ->
      t.player = @
      watched = false
      aspectRatio = 9/16
      resizeVideoJS = () ->
        width = document.getElementById(t.player.id()).parentElement.offsetWidth
        t.player.width(width).height( width * aspectRatio )
      resizeVideoJS()
      window.onresize = resizeVideoJS
      @on("timeupdate", ->
        console.log "Duration:" + @duration()
        console.log "Current Time:" + @currentTime()
        console.log  @currentTime() / @duration()
        if(watched == false &&  @currentTime() / @duration()  >= .80)
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
  actions:
    newComment: ->
      cForm = "<div>"
      cForm += "<fieldset>"
      if @get('comment')
        cForm += "<textarea style='width:550px;height:250px;' class='newComment" +  @get('comment').get('id') + "'></textarea>"
        cForm += "<br/>"
        cForm += "<button class='btn-primary btn' id='" + @get('comment').get('id')  + "'>Comment</button>"
        this.$().append cForm
        $('.newComment'+ @get('comment').get('id')).summernote()
        $("#" + @get('comment').get('id')+'.btn').click =>
          comment = PixelMob.Comment.create
            content: $('.newComment' + @get('comment').get('id')).code()
            parent_comment: PixelMob.Comment.find(@get('comment').get('id'))
            video: @get('controller').get('content')
            user: PixelMob.current_user
          comment.save()
          @get('controller').get('content').reload()
          comment.reload()
      else
        cForm += "<textarea style='width:550px;height:250px;' class='newCommentFirst'></textarea>"
        cForm += "<br/>"
        cForm += "<button class='btn-primary btn' id='submitButton'>Comment</button>"
        this.$().append cForm
        $('.newCommentFirst').summernote()
        $("#submitButton.btn" ).click =>
          comment = PixelMob.Comment.create
            content: $('.newCommentFirst' ).code()
            video: @get('controller').get('content')
            user: PixelMob.current_user
          comment.save()
          @get('controller').get('content').get('comments').reload()
