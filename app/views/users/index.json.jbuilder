json.array!(@users) do |user|
  json.extract! user, :id, :firsname, :surname
  json.url user_url(user, format: :json)
end
