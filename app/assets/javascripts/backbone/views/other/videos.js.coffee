Trenderio.Views.Other ||= {}

class Trenderio.Views.Other.VideoView extends Backbone.View
  template: JST["backbone/templates/other/videos"]

  render: =>
    $(@el).html(@template());
    return this
