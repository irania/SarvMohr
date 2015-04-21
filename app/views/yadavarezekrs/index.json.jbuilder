json.array!(@yadavarezekrs) do |yadavarezekr|
  json.extract! yadavarezekr, :id, :saat, :min, :tozihat
  json.url yadavarezekr_url(yadavarezekr, format: :json)
end
