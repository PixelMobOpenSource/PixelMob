PixelMob.UploadFileView = Ember.View.extend
  templateName: "upload_file"
  channels: null
  id: null
  name: null
  videoURL: null
  videoID: null
  vast: null
  description: null
  tags: PixelMob.Tag.find()
  channel_id: null
  tag_ids: null
  didInsertElement: ->
    $('#tag').select2()
    videojs("#{@get('videoID')}")
    t = @
    $('.uploadFormElement').change =>
      console.log("Change!")
      $("#loading").text "Saving..."
      $.ajax(
        url: "/api/videos/update/" + t.get('id')
        type: "post"
        data:
          video:
            name: t.get("name")
            vast: t.get("vast")
            tag_ids: t.get("tag_ids")
            description: t.get("description")
            channel_id: $("#channel").val()
      ).done (data) ->
        $("#loading").text "Saved"
  actions:
    save: ->
      t = @
      $("#loading").text "Saving..."
      $.ajax(
        url: "/api/videos/update/" + @get('id')
        type: "post"
        data:
          video:
            name: t.get("name")
            vast: t.get("vast")
            tag_ids: t.get("tag_ids")
            description: t.get("description")
            channel_id: $("#channel").val()
      ).done (data) ->
        $("#loading").text "Saved"
