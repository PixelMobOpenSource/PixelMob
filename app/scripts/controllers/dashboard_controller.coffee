PixelMob.DashboardController = Ember.ObjectController.extend
  needs: ['currentUser']
  queryParams: ['video_page', 'channel_id']
  video_page: null
  channel_id: ''
  channel: ( ->
    return PixelMob.Channel.find(@get('channel_id'))
  ).property('channel_id')
  actions:
    saveChannel: ->
      console.log("test")
      console.log(@get('channel').get('name'))
      channel = @get('channel')
      channel.save()
  launchkey: ->
    user = @get('username')
    $.ajax
      url: "/api/user/launchkey/" + user
      type: "GET"
      data:
        user_id:  PixelMob.current_user.get('id')
        first_time: true
      success: (data, textStatus, xhr) ->
        if data
          PixelMob.CloseAlert()
          PixelMob.Alert('','You Are Now Logged In',"Success")
          PixelMob.ReloadUser()
