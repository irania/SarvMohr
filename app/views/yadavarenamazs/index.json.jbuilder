json.array!(@yadavarenamazs) do |yadavarenamaz|
  json.extract! yadavarenamaz, :id, :saat, :min, :tozihat
  json.url yadavarenamaz_url(yadavarenamaz, format: :json)
end
