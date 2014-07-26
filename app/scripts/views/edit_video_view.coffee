PixelMob.EditVideoView = Ember.View.extend
	tags: PixelMob.Tag.find()
	willDestroyElement: ->
		clone = this.$().clone()
		this.$().replaceWith(clone)
		clone.slideUp(500, "easeInOutQuad")
	didInsertElement: ->
		this.$().slideUp(0);
		this.$().slideDown(500);
		videojs.Na = {}
		videojs(@get('controller').get('content').get('id'))
		$('#tag').select2()
		tagsData = []
		@get('controller').get('tags').forEach (tag) =>
			tagsData.push({id: tag.get('id'), text: tag.get('name')})
		$('#tag').select2("data", tagsData)
	addButton: (type) ->
		console.log("addButton")
		button = $("<div class='btn btn-#{type}' style='position:relative;'>Temp</div>")
		$(".video-js").append(button)
		button.draggable({ containment: "parent",
		stop: (event,ui) ->
			$(this).css("left",parseInt($(this).css("left")) / ($(".door").width() / 100)+"%")
			$(this).css("top",parseInt($(this).css("top")) / ($(".door").height() / 100)+"%")
		})
	save: ->
		@get('controller').get('content').set('name',$('#name').val())
		@get('controller').get('content').set('description',$('#description').val())
		@get('controller').get('content').save()
