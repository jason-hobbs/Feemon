json.array!(@feeds) do |feed|
  json.extract! feed, :id, :title, :site, :url
  json.url feed_url(feed, format: :json)
end
