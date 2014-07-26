PixelMob.User = Ember.Model.extend
  id:           Ember.attr()
  email:          Ember.attr()
  password:         Ember.attr()
  links:          Ember.attr()
  gravatar_url:       Ember.attr()
  channels:         Ember.hasMany("PixelMob.Channel", {key: 'channel_ids'})
  comments:         Ember.hasMany("PixelMob.Comment", {keys: 'comment_ids'})
  subscriptions_videos:   Ember.hasMany("PixelMob.Video", {key: 'subscriptions_video_ids'})
  subscriptions_channels: Ember.hasMany("PixelMob.Channel", {key: 'subscription_channel_ids'})
PixelMob.User.url = "/api/user"
PixelMob.User.adapter = Ember.RESTAdapter.create()
PixelMob.User.collectionKey = 'users'
PixelMob.User.rootKey = 'user'
