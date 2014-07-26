PixelMob.SignupView = Ember.View.extend
  templateName: 'signup'
  willDestroyElement: ->
    clone = this.$().clone()
    this.$().replaceWith(clone)
    clone.slideUp(500, "easeInOutQuad")
  didInsertElement: ->
    this.$().slideUp(0);
    this.$().slideDown(500);
    $("#signUpForm").validate({
      rules:
        email:
          required: true
          email: true
        pass:
          required: true
          minlength: 8
          maxlength: 128
      highlight: (element) ->
        $(element).closest('.validation').replaceWith('<span class="validation">X</span>').attr('style','color:red;').closest('.control-group').removeClass('success').addClass('error');
      success: (element) ->
        $(element).closest('.validation').text('<i class="validation icon-check-sign"></i>').closest('control-group').removeClass('error').addClass('success')
    })
