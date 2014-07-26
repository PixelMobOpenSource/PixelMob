PixelMob.ChannelController = Ember.ObjectController.extend
  needs: ["currentUser"]
  queryParams: ['video_page']
  video_page: null
