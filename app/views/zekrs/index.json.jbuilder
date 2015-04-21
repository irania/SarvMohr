json.array!(@zekrs) do |zekr|
  json.extract! zekr, :id, :name, :tozihat, :tedad
  json.url zekr_url(zekr, format: :json)
end
