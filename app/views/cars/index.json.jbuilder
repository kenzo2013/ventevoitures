json.array!(@cars) do |car|
  json.extract! car, :id, :brand, :model, :price, :energy, :image
  json.url car_url(car, format: :json)
end
