class Trenderio.Models.Story extends Backbone.Model
  paramRoot: 'story'

  defaults:
    title: null
    extract: null
    image: null
    time: null
    rating: null
    url: null

class Trenderio.Collections.StoriesCollection extends Backbone.Collection
  model: Trenderio.Models.Story
  url: '/stories'
