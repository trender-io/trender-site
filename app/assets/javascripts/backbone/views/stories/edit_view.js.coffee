Trenderio.Views.Stories ||= {}

class Trenderio.Views.Stories.EditView extends Backbone.View
  template : JST["backbone/templates/stories/edit"]

  events :
    "submit #edit-story" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (story) =>
        @model = story
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
