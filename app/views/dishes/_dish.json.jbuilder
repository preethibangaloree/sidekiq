json.extract! dish, :id, :title, :name, :price, :restaurants_id, :created_at, :updated_at
json.url dish_url(dish, format: :json)
