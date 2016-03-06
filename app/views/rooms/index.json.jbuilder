json.array!(@rooms) do |room|
  json.extract! room, :id, :nmae
  json.url room_url(room, format: :json)
end
