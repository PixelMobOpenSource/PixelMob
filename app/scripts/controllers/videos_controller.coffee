PixelMob.VideosController = Ember.ArrayController.extend
    needs: ['currentUser']
    page: 0
    pageMTwo: 0
    pageMOne: 0
    pageOne: 0
    pageTwo: 0
    lastPage: false
    actions:
        sort: (e) ->
            console.log(e)
            @set('sortProperties',[e])
        toggleAcending: ->
            if @get('sortAscending')
                @set('sortAscending',false)
            else
                @set('sortAscending',true)
