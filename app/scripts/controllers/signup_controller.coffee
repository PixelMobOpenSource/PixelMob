PixelMob.SignupController = Ember.Controller.extend
    signUp: ->
        console.log @getProperties('email','password')
        user = PixelMob.User.createRecord @getProperties('email','password')
        user.get('transaction').commit()
