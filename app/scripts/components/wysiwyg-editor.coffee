PixelMob.WysiwygEditorComponent = Ember.Component.extend(
  classNames: ["wysiwyg-editor"]
  btnSize: ""
  height: 120
  content: "test123"
  willDestroyElement: ->
    @$("textarea").destroy()
  didInsertElement: ->
    _this = this
    btnSize = @get("btnSize")
    height = @get("height")
    content = @get("content")
    console.log content
    @$(".wysiwyg-textarea").summernote
      height: height
      toolbar: [
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['insert', ['link']],
        ['table', ['table']],
        ['help', ['help']]
      ]
    @$("textarea").code content
    @$(".btn").addClass btnSize

  keyUp: ->
    @doUpdate()

  click: ->
    @doUpdate()

  doUpdate: ->
    content = @$(".note-editable").html()
    @set "content", content
)
