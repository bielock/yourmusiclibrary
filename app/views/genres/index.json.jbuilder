json.array!(@genres) do |genre|
  json.extract! genre, :id, :gname
  json.url genre_url(genre, format: :json)
end
