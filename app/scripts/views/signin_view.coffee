PixelMob.SigninView = Ember.View.extend
  willDestroyElement: ->
    clone = this.$().clone()
    this.$().replaceWith(clone)
    clone.slideUp(500, "easeInOutQuad")
  didInsertElement: ->
    this.$().slideUp(0);
    this.$().slideDown(500)
    script = document.createElement('script')
    script.type = 'text/javascript'
    script.src = "https://clef.io/v2/clef.js"
    script.setAttribute('data-app-id','5da008568d5b331c24cf0820cb32fd74')
    script.setAttribute('data-style','flat')
    script.setAttribute('data-redirect-url',"http://pixelmob.co:88/users/auth/clef/callback")
    script.setAttribute('data-color',"blue")
    script.setAttribute('class',"clef-button")
    $('#clef-container').append(script)