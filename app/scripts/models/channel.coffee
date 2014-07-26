PixelMob.Channel = Ember.Model.extend(
  id: Ember.attr()
  name: Ember.attr()
  description: Ember.attr()
  subscribed: Ember.attr()
  subscribers: Ember.hasMany('PixelMob.User',{key:'subscriber_ids'})
  avatar: Ember.attr()
  videos: Ember.hasMany("PixelMob.Video", {key: 'video_ids'})
  users: Ember.hasMany("PixelMob.User", {key: 'user_ids'})
  url: ->
    return '/#/channel' + @id
)
PixelMob.Channel.url = '/api/channels'
PixelMob.Channel.adapter = Ember.RESTAdapter.create()
PixelMob.Channel.collectionKey = 'channels'
PixelMob.Channel.rootKey = 'channel'
