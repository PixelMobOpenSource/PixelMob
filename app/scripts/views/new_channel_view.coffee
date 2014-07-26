PixelMob.NewChannelView = Ember.View.extend
	willDestroyElement: ->
		clone = this.$().clone()
		this.$().replaceWith(clone)
		clone.slideUp(500, "easeInOutQuad")
	didInsertElement: ->
		this.$().slideUp(0);
		this.$().slideDown(500);
		console.log("test")
		$('#file').fileupload
			datatype: 'json'
			url: "/api/channels/"
			add: (e,d) ->
				console.log("test")
				$("#submit").click ->
					console.log("test")
					d.submit()
			done: (e,d) ->
				id = d.result["channel"]["id"];
				$.ajax(
					type: "PUT"
					data:
						channel:
							name: $('#name').val()
					url: "/api/channels/" + id
				)
