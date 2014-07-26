## Credits: https://gist.github.com/aboma/5737133 Modified by Sascha Wise
PixelMob.Select2 = Ember.Select.extend(
  defaultTemplate: Ember.Handlebars.compile("<option>{{#if prompt}}{{unbound prompt}}{{/if}}</option>{{#each view.content}}{{view Ember.SelectOption contentBinding=\"this\"}}{{/each}}<option value='newChannel'>New Channel</option>")
  attributeBindings: ["required"]
  required: false
  width: "resolve"
  allowClear: true
  closeOnSelect: true

  # initialize Select2 once view is inserted in DOM
  didInsertElement: ->
    #this._super();
    select2Format  = @get("templateFormat")
    modelClass = PixelMob[@get('model')]
    select2FormatFunc = (content) ->
        unless(content.id)
            content.text
        else
          if(select2Format)
            model = modelClass.find(content.id)
            if model.isLoaded
              template = Handlebars.compile(select2Format)
              data = {"content": content}
              templateString = template(data)
              newTemplate = templateString.replace("<% srcAvatar %>", "<img width='25px' src='" + model.get('avatar').avatar.url + "'></img>")
              return newTemplate
            else
              return content.text
    placeholderText = @get("prompt") or ""
    throw new Exception("select2 is required for Vilio.Select2 control")  unless @$().select2
    @$().select2
      containerCssClass: "select2-portfolio"
      placeholder: placeholderText
      formatResult: select2FormatFunc
      formatSelection: select2FormatFunc
      escapeMarkup: (m) ->
        return m
      allowClear: @get("allowClear")
      closeOnSelect: @get("closeOnSelect")
      width: @get("width")
    channelPromise = modelClass.fetch(@get('value'))
    channelPromise.then(
      (channel) =>
        @$().select2 "data", {id: @get('value'), text: channel.get('name') }
      ,
      =>
        console.log "ERROR"
    )
  willDestroyElement: ->
    console.log "destroying select2"
    @$().select2 "destroy"


  # when data is loaded, update select2 to show
  # this data

  # trigger change event on selectbox once data
  # has been loaded to update options values

  # trigger change event on select2
  itemsLoaded: ( ->
    console.log "select2 items loaded"
    Ember.run.sync()
    Ember.run.next this, ->
      console.log @get('value')
      @$().select2 "val", @get('value')
      console.log "updating select2 options list"
      @$().change()  if @$()

  ).observes("controller.content.isLoaded")
  setSelectedValue: (value) ->
    console.log "setting select2 selected value to " + value
    @$().select2 "val", value


  # observe controller selected content and update select2
  # selected item if selected item is changed on the
  # controller and does not match currently selected value;
  # this occurs when the selected value is changed outside of
  # the control; must wait until next ember run since
  # it seems that after create, a new item is not yet available
  # in the list to be selected

  # trigger change event on selectbox once data
  # has been loaded to update options values
  setSelected: ( ->
    path = @get("optionValuePath")
    s = path.split(".")
    fieldname = s[s.length - 1]
    fieldvalue = ""
    selected = @get("controller.selected")
    sel2Val = @$().select2("val")
    fieldvalue = selected.get(fieldname)  if selected
    if sel2Val isnt fieldvalue or fieldvalue is ""
      Ember.run.sync()
      Ember.run.next this, ->
        @setSelectedValue @get('value')

  ).observes("controller.selected")
)
