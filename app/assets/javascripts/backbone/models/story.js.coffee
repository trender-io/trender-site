class Trenderio.Models.Story extends Backbone.Model
  paramRoot: 'story'

  defaults:
    title: null
    extract: null
    image: null
    time: new Date()
    rating: null
    url: null
    categories: 'news'

class Trenderio.Collections.StoriesCollection extends Backbone.Collection
  model: Trenderio.Models.Story
  url: '/stories'
