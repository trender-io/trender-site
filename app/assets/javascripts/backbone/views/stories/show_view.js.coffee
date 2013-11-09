Trenderio.Views.Stories ||= {}

class Trenderio.Views.Stories.ShowView extends Backbone.View
  template: JST["backbone/templates/stories/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
