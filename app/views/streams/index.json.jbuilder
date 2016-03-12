json.array!(@streams) do |stream|
  json.extract! stream, :id, :name, :provider
  json.url stream_url(stream, format: :json)
end
