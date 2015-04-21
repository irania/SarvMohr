json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :lastname, :phone, :email, :address, :mohr_code
  json.url profile_url(profile, format: :json)
end
