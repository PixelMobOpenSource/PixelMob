PixelMob.DashboardController = Ember.ObjectController.extend({
    needs: ['currentUser']
    queryParams: ['video_page', 'channel_id']
    video_page: null
    channel_id: ''
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
})
