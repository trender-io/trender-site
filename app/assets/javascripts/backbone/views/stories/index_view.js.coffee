Trenderio.Views.Stories ||= {}

class Trenderio.Views.Stories.IndexView extends Backbone.View
  template: JST["backbone/templates/stories/index"]

  initialize: () ->
    @options.stories.bind('reset', @addAll)

  addAll: () =>
    @options.stories.each(@addOne)

  addOne: (story) =>
    view = new Trenderio.Views.Stories.StoryView({model : story})
    @$("#columns").append(view.render().el)

  render: =>
    $(@el).html(@template(stories: @options.stories.toJSON() )).timeago();
    @addAll()
    this.$el.find('.timeago').timeago();
    $('nav a').remove('active');
    return this
