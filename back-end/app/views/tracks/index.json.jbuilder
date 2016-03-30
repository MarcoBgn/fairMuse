json.array!(@tracks) do |track|
  json.extract! track, :id
  json.url track_url(track, format: :json)
  json.file track.file.url
end
