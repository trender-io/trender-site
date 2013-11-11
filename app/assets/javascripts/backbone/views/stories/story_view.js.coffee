Trenderio.Views.Stories ||= {}


class Trenderio.Views.Stories.StoryView extends Backbone.View
  template: JST["backbone/templates/stories/story"]

  events: ->
    "click .destroy" : "destroy"
    "click .rating" : 'showhover'

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

  showhover: => 
    this.$('.rating', this).popover();