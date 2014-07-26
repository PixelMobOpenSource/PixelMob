PixelMob.DashboardView = Ember.View.extend
  templateName: 'dashboard'
  videos: null
  channel: null
  channel_id: null
  ifVideos: false
  ifAllVideos: true
  allVideos: ->
    @set('ifVideos',false)
    @set('ifAllVideos',true)
  channelIdChanged: (  ->
    @set('channel',PixelMob.Channel.find(@get('channel_id')))
    @set('videos',PixelMob.Channel.find(@get('channel_id')).get('videos'))
    @set('ifVideos',true)
    @set('ifAllVideos',false)
    console.log('test')
  ).observes('channel_id')
  willDestroyElement: ->
    clone = this.$().clone()
    this.$().replaceWith(clone)
    clone.slideUp(500, "easeInOutQuad")
  didInsertElement: ->
    this.$().slideUp(0)
    this.$().slideDown(500)
    $('#editNav').sortable({placeholder: "list-group-item", connectWith: "#originNav"})
    $('#originNav').sortable({placeholder: "list-group-item", connectWith: "#editNav"})
  saveUser: ->
    console.log(@get('channel').get('id'))
    PixelMob.current_user.set('email',$('#email').val())
    PixelMob.current_user.get('transaction').commit()
  actions:
    saveLinks: ->
      linksArray = []
      $('#editNav').children('li').each ->
      console.log($(@))
      console.log($(@).attr('href'))
      if($(@).attr('href') == "dashboard")
        linksArray.push({ name: $(@).children('span').text(), icon: $(@).children('i').attr('class'), action: $(@).attr('href'), isDash: true})
      else
        linksArray.push({ name: $(@).children('span').text(), icon: $(@).children('i').attr('class'), action: $(@).attr('href') })
      console.log(linksArray)
      PixelMob.current_user.set('links',linksArray)
      PixelMob.current_user.save()
