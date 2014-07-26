PixelMob.UploadContainerView = Ember.ContainerView.extend
  classNames: "uploadcontainer"
  childViews: [PixelMob.UploadButtonView.create()]
  templateName: "upload_container"
  didInsertElement: ->
    console.log('test5')
