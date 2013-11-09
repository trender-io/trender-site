Trenderio.Views.Stories ||= {}


class Trenderio.Views.Stories.StoryView extends Backbone.View
  template: JST["backbone/templates/stories/story"]

  events:
    "click .destroy" : "destroy"

  tagName: "div"
  className: "single"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    this.$('.rating', this).popover('hide');
    return this

  events: =>
    "click .rating" : 'showhover'


  showhover: => 
    this.$('.rating', this).popover();