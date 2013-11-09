Trenderio.Views.Stories ||= {}

class Trenderio.Views.Stories.NewView extends Backbone.View
  template: JST["backbone/templates/stories/new"]

  events:
    "submit #new-story": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (story) =>
        @model = story
        window.location.hash = "/#{@model.id}"

      error: (story, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
