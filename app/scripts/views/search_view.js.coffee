PixelMob.SearchView = Ember.View.extend
    search: ""
    willDestroyElement: ->
        clone = this.$().clone()
        this.$().replaceWith(clone)
        clone.slideUp(500, "easeInOutQuad")
    didInsertElement: ->
        this.$().slideUp(0);
        this.$().slideDown(500);