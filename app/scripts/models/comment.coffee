PixelMob.Comment = Ember.Model.extend
    id:             Ember.attr()
    content:        Ember.attr()
    video:          Ember.belongsTo("PixelMob.Video", {key: 'video_id'})
    user:           Ember.belongsTo("PixelMob.User", {key: 'user_id'})
    parent_comment: Ember.belongsTo("PixelMob.Comment" , {key: 'parent_comment_id'})
    child_comments: Ember.hasMany("PixelMob.Comment", {key: 'child_comment_ids'})
PixelMob.Comment.url = "/api/comments"
PixelMob.Comment.adapter = Ember.RESTAdapter.create()
PixelMob.Comment.collectionKey = 'comments'
PixelMob.Comment.rootKey = 'comment'
