json.array!(@albums) do |album|
  json.extract! album, :id, :artist_id, :title, :year
  json.url album_url(album, format: :json)
end
