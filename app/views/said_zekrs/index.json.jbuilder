json.array!(@said_zekrs) do |said_zekr|
  json.extract! said_zekr, :id, :zekr_type, :num_of_zekrs, :start_time, :date
  json.url said_zekr_url(said_zekr, format: :json)
end
