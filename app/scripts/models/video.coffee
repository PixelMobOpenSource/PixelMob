PixelMob.Video = Ember.Model.extend
  id:      Ember.attr()
  tags:    Ember.hasMany('PixelMob.Tag', {key: 'tag_ids'})
  name:    Ember.attr()
  description: Ember.attr()
  file:    Ember.attr()
  comments:  Ember.hasMany("PixelMob.Comment", {key: 'comment_ids'})
  channel:   Ember.belongsTo("PixelMob.Channel", {key: 'channel_id'})
  rank:    Ember.attr()
  owned:     Ember.attr()
  views:     Ember.attr()
  game:    Ember.belongsTo("PixelMob.Game", {key: 'game_id'})
  vast:    Ember.attr()
  upVoted:   Ember.attr()
  downVoted:   Ember.attr()
  upVotes:   Ember.attr()
  downVotes:   Ember.attr()
  is1080p:   Ember.attr()
  token:     Ember.attr()
  is720p:    Ember.attr()
  slug:    Ember.attr()
  smallName:  ( ->
    if(Ember.String.htmlSafe(@get('name')).string)
      Ember.String.htmlSafe(@get('name')).string.trunc(25)
  ).property('name')
  url:     ( ->
    "/#/videos/" + @get("id")
  ).property("id")
PixelMob.Video.url           = "/api/videos"
PixelMob.Video.adapter       = Ember.RESTAdapter.create()
PixelMob.Video.collectionKey = 'videos'
PixelMob.Video.rootKey       = 'video'
