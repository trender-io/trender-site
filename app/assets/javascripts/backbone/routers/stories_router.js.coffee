class Trenderio.Routers.StoriesRouter extends Backbone.Router
  initialize: (options) ->
    @stories = new Trenderio.Collections.StoriesCollection()
    @stories.reset options.stories

  routes:
    "new"      : "newStory"
    "index"    : "index"
    "story/:id/edit" : "edit"
    "story/:id"      : "show"
    ".*"             : "index"
    "place/:loc"     : "place"
    "cat/:cat"       : "cat"
    "about"          : "about"
  
  deselectNavs: ->
    $('ul.nav a').removeClass('active');

  selectNav: (nav) ->
    this.deselectNavs();
    $(this).scrollTop(0);
    $('ul.nav #'+nav).addClass('active');
    $('#stories li.single').wookmark({itemWidth:300, autoResize:true, offset:5, container: $('#stories')});

  newStory: ->
    @view = new Trenderio.Views.Stories.NewView(collection: @stories)
    $("#stories").html(@view.render().el)

  index: ->
    @view = new Trenderio.Views.Stories.IndexView(stories: @stories)
    $("#stories").html(@view.render().el)
    this.selectNav('index');

  place: (loc) ->
    @view = new Trenderio.Views.Stories.IndexView(stories: @stories, place: loc)
    $("#stories").html(@view.render().el)
    this.selectNav('place-'+loc);

  cat: (cat) ->
    @view = new Trenderio.Views.Stories.IndexView(stories: @stories, cat: cat)
    $("#stories").html(@view.render().el)
    this.selectNav('cat-'+cat);

  show: (id) ->
    story = @stories.get(id)

    @view = new Trenderio.Views.Stories.ShowView(model: story)
    $("#stories").html(@view.render().el)

  edit: (id) ->
    story = @stories.get(id)

    @view = new Trenderio.Views.Stories.EditView(model: story)
    $("#stories").html(@view.render().el)


  about: ->
    @view = new Trenderio.Views.Other.AboutView()
    $("#stories").html(@view.render().el)
    this.selectNav('about');
