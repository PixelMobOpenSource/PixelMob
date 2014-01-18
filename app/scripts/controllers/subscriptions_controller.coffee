PixelMob.SubscriptionsController = Ember.ArrayController.extend
    needs: ['currentUser']
    queryParams: ['page']
    page: null
    force: null
    pageInfo: ( ->
        tempArray = {}
        if(@get('page'))
            tempArray.page = @get('page')
        else
            @set('page',1)
        $.ajax({url: '/api/videos/lastpage?subscriptions=true', type: "get", async: false}).done (result) =>
            unless(parseInt(@get('page')) == parseInt(result))
                tempArray.pageOne = parseInt(@get('page')) + 1
            else
                tempArray.pageOne = false
                tempArray.pageTwo = false
            if(parseInt(@get('page')) + 2 <= parseInt(result))
                tempArray.pageTwo = parseInt(@get('page')) + 2
            if(parseInt(@get('page')) > 1)
                tempArray.pageMOne = parseInt(@get('page')) - 1
            else
                tempArray.pageMOne = false
            if(parseInt(@get('page')) > 1)
                tempArray.pageMTwo = parseInt(@get('page')) - 2
            else
                tempArray.pageMTwo = false
        console.log tempArray
        return tempArray
    ).property('page')
    actions:
        sort: (e) ->
            console.log(e)
            @set('sortProperties',[e])
        toggleAcending: ->
            if @get('sortAscending')
                @set('sortAscending',false)
            else
                @set('sortAscending',true)
