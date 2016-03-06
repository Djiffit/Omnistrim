json.array!(@streams) do |stream|
  json.extract! stream, :id, :provider, :channel
  json.url stream_url(stream, format: :json)
end
