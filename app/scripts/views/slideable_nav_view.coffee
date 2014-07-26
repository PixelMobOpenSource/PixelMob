PixelMob.SlidableNavView = Ember.View.extend
  actions:
    arrowClick: (e) ->
      console.log('test')
      $('#nav').children('#hiddenDefaultElems').slideToggle ->
        #if $(@).css('display') == 'inline' then $(@).css('display','block')
        $('#nav').children('.showenDefaultElem').children().toggleClass('navBoxArrow-upSideDown')
