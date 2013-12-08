Trenderio.Views.Stories ||= {}

class Trenderio.Views.Stories.IndexView extends Backbone.View
  template: JST["backbone/templates/stories/index"]

  initialize: () ->
    @options.stories.bind('reset', @addAll)

  addAll: () =>
    @options.stories.each(@addOne)

  addOne: (story) =>
    theseCats = story.attributes.categories
    if @options.cat
      cat = @options.cat
    if @options.place
      cat = @options.place
    # Don't show if in sub-category and it has no category
    if (cat && story.attributes.categories == null)
      return
    # If category, only show if included in list
    if (cat)
      if story.attributes.categories.indexOf(cat) < 0
        return
    view = new Trenderio.Views.Stories.StoryView({model : story})
    @$("#columns").append(view.render().el)

  render: =>
    $(@el).html(@template(stories: @options.stories.toJSON() ));
    @addAll()
    this.$el.find('.timeago').timeago();
    $('nav a').remove('active');    
    return this
