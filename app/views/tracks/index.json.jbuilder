json.array!(@tracks) do |track|
  json.extract! track, :id, :album_id, :t_name
  json.url track_url(track, format: :json)
end
