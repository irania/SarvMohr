json.array!(@namazs) do |namaz|
  json.extract! namaz, :id, :tedad_rokat, :name, :tozihat, :tedad
  json.url namaz_url(namaz, format: :json)
end
