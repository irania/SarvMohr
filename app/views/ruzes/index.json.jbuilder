json.array!(@ruzes) do |ruze|
  json.extract! ruze, :id, :name, :tozihat, :tedad
  json.url ruze_url(ruze, format: :json)
end
