json.array!(@destinations) do |destination|
  json.extract! destination, :id, :name, :address, :access
  json.url destination_url(destination, format: :json)
end
