json.array!(@stories) do |story|
  json.extract! story, :title, :extract, :image, :rating, :url, :categories
  json.url story_url(story, format: :json)
end
