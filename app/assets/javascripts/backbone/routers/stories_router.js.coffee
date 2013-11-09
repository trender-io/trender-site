class Trenderio.Routers.StoriesRouter extends Backbone.Router
  initialize: (options) ->
    @stories = new Trenderio.Collections.StoriesCollection()
    @stories.reset options.stories

  routes:
    "new"      : "newStory"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"
  
  newStory: ->
    @view = new Trenderio.Views.Stories.NewView(collection: @stories)
    $("#stories").html(@view.render().el)

  index: ->
    @view = new Trenderio.Views.Stories.IndexView(stories: @stories)
    $("#stories").html(@view.render().el)

  show: (id) ->
    story = @stories.get(id)

    @view = new Trenderio.Views.Stories.ShowView(model: story)
    $("#stories").html(@view.render().el)

  edit: (id) ->
    story = @stories.get(id)

    @view = new Trenderio.Views.Stories.EditView(model: story)
    $("#stories").html(@view.render().el)
