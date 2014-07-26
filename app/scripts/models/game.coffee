PixelMob.Game = Ember.Model.extend
  id:      Ember.attr()
  name:    Ember.attr()
  description: Ember.attr()
  cover:     Ember.attr()
  videos:    Ember.hasMany("PixelMob.Video", {key: 'video_ids'})
PixelMob.Game.url = "/api/games"
PixelMob.Game.adapter = Ember.RESTAdapter.create()
PixelMob.Game.collectionKey = 'games'
PixelMob.Game.rootKey = 'game'
