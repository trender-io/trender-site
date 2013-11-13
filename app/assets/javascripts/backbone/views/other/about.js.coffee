Trenderio.Views.Other ||= {}

class Trenderio.Views.Other.AboutView extends Backbone.View
  template: JST["backbone/templates/other/about"]

  render: =>
    $(@el).html(@template());
    return this
