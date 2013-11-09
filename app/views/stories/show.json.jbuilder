json.extract! @story, :title, :extract, :image, :rating, :url, :created_at, :updated_at
json.time @story, time_ago_in_words(:time)