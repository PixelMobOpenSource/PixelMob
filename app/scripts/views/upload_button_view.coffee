PixelMob.UploadButtonView = Ember.View.extend
  templateName: "upload_button"
  tags: PixelMob.Tag.find()
  didInsertElement: ->
    t = @
    id = undefined
    console.log('test')
    $.ajax(
      url: "/api/videos/new"
    ).done (msg) ->
      PixelMob.current_user.get("channels").reload() # I know I know this doesnt do anything but trust me it does
      $("#fileupload").fileupload
        dataType: "json"
        maxNumberOfFiles: 1
        dropZone: $('#dropZone.well')
        type: "POST"
        url: "/api/videos/update/" + msg
        done: (e, data) ->
          averageTimePer = 0
          times = []
          oldTime = new Date().getTime()
          PixelMob.Alert('Success','Your file had finished uploading now wait for it to process',"Success")
          $('#progressbar').addClass("progress-bar-success")
          $('#progressbar').css("width","0%")
          client = new Faye.Client("http://pixelmob.co:8008/faye/")
          client.subscribe("/videoProgress/" + msg, (message) ->
            console.log(message)
            times.push(new Date().getTime() - oldTime)
            time = times.average()
            oldTime = new Date().getTime()
            $('#progressbar').css("width",message.progress + "%")
            progressConcat = Math.floor10(message.progress,-2)
            date = new Date(time * (100 - progressConcat))
            timeForm = ('0' + date.getUTCHours()).slice(-2) + ':' + ('0' + date.getUTCMinutes()).slice(-2) + ':' + ('0' + date.getUTCSeconds()).slice(-2) + " Time Remaning"
            $('#uploadTime').text(timeForm)
          )
        progressall: (e, data) ->
          progress = parseInt(data.loaded / data.total * 100, 10)
          seconds = (data.total - data.loaded) * 8 / data.bitrate
          $('#uploadSpeed').text((data.bitrate/1000000).toFixed(2) + "Mbps")
          date = new Date(seconds * 1000)
          time = ('0' + date.getUTCHours()).slice(-2) + ':' + ('0' + date.getUTCMinutes()).slice(-2) + ':' + ('0' + date.getUTCSeconds()).slice(-2) + " Time Remaning"
          $('#uploadTime').text(time)
          $("#progressbar ").css("width", progress + "%")
          $(document).skylo 'start'
          $(document).skylo 'set',progress
        add: (e, data) ->
          console.log(data)
          data.submit()
          videoURL = URL.createObjectURL(data.fileInput[0].files[0])
          $(document).skylo
            state: 'info',
            inchSpeed: 200,
            initialBurst: 0
          uploadFile = PixelMob.UploadFileView.create()
          console.log uploadFile.get('templateName')
          uploadFile.set('id',msg)
          uploadFile.set('videoID',"video" + id)
          uploadFile.set('videoURL',videoURL)
          uploadFile.set('name',data.files[0].name)
          t.get('parentView').pushObject(uploadFile)
