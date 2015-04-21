json.array!(@mohrs) do |mohr|
  json.extract! mohr, :id, :mohr_code
  json.url mohr_url(mohr, format: :json)
end
