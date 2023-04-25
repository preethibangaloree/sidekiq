class RestaurantStatusJob < ApplicationJob
  queue_as :default

  # def perform(restaurant_id,status)
  #   restaurant = Restaurant.find(restaurant_id)
  #   restaurant.update(status: restaurant.status == "open" ? "closed" : "open")
  # end

  def perform(restaurant_id, status)
    sleep(5.minutes)
    restaurant = Restaurant.find(restaurant_id)
    restaurant.update(status: restaurant.status == "open" ? "closed" : "open")
  end
end
