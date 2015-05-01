json.array!(@readed_namazs) do |readed_namaz|
  json.extract! readed_namaz, :id, :date, :start_time, :period, :stateus, :type
  json.url readed_namaz_url(readed_namaz, format: :json)
end
