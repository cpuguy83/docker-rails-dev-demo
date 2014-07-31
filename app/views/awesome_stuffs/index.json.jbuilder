json.array!(@awesome_stuffs) do |awesome_stuff|
  json.extract! awesome_stuff, :id, :name
  json.url awesome_stuff_url(awesome_stuff, format: :json)
end
