PixelMob.SignupController = Ember.Controller.extend
  actions:
    signUp: ->
      console.log @getProperties('email','password')
      user = PixelMob.User.create @getProperties('email','password')
      user.save()
