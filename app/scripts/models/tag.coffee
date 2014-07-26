PixelMob.Tag = Ember.Model.extend
  name:    Ember.attr()
  description: Ember.attr()
  videos:    Ember.hasMany('PixelMob.Video', {key: 'video_ids'})
  users:		 Ember.hasMany('PixelMob.User', {key: 'user_ids'})
PixelMob.Tag.url = "/api/tags"
PixelMob.Tag.adapter = Ember.RESTAdapter.create()
PixelMob.Tag.collectionKey = 'tags'
PixelMob.Tag.rootKey = 'tag'
