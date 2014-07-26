PixelMob.EditVideoController = Ember.ObjectController.extend
  tag_ids: null
  actions:
    save: ->
      console.log "test"
      tagsPromise = PixelMob.Tag.fetch($('#tag').val())
      tagsPromise.then (tags) =>
        @get('content').get('tags').setObjects(tags)
        @get('content').save()
      , ->
        console.log "ERROR"
