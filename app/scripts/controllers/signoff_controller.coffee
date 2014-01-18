PixelMob.SignoffController = Ember.Controller.extend(
    signOff: ->
        $.ajax
            url: "/users/sign_out.json"
            type: "delete"
            dataType: "json"
            success: (data, textStatus, xhr) ->
                PixelMob.CloseAlert()
                PixelMob.Alert('Success: ','You Are Now Logged Out', 'Success')
                PixelMob.SetToken(data.csrfToken)
                PixelMob.ReloadUser()
                window.location.href = "/#/"
)
