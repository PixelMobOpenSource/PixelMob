PixelMob.SigninController = Ember.Controller.extend
  actions:
    signIn: ->
      $.ajax
        url: "/users/sign_in"
        type: "POST"
        dataType: "json"
        data:
          user: @getProperties('email','password')
        success: (data, textStatus, xhr) ->
          console.log data
          PixelMob.CloseAlert()
          PixelMob.Alert('','You Are Now Logged In',"Success")
          PixelMob.ReloadUser()
        error: (jqXhr,textStatus,error) ->
          console.log error
          PixelMob.CloseAlert()
          PixelMob.Alert('Error',jQuery.parseJSON(jqXhr.responseText)["error"],"Error")
    launchkey: ->
      user = @get('username')
      $.ajax
        url: "/api/user/launchkey/" + user
        type: "GET"
        success: (data, textStatus, xhr) ->
          if data
            PixelMob.CloseAlert()
            PixelMob.Alert('','You Are Now Logged In',"Success")
            PixelMob.ReloadUser()
