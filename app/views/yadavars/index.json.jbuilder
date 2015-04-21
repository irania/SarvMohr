json.array!(@yadavars) do |yadavar|
  json.extract! yadavar, :id, :saat, :min, :tozihat
  json.url yadavar_url(yadavar, format: :json)
end
