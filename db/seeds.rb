# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

restaurant1 = Restaurant.create(title: "Italian Restaurant", status: "open")
restaurant2 = Restaurant.create(title: "Mexican Restaurant", status: "open")
restaurant3 = Restaurant.create(title: "Indian Restaurant", status: "open")


dish1 = restaurant1.dishes.create(name: "Pasta", price: 100)
dish2 = restaurant1.dishes.create(name: "Pizza", price: 200)
dish3 = restaurant2.dishes.create(name: "Taco", price: 300)
dish4 = restaurant2.dishes.create(name: "Burrito", price: 400)
dish5 = restaurant3.dishes.create(name: "chiken gravy", price: 200)



review1 = dish1.reviews.create(rate: 5, comments: "The pasta was good!")
review2 = dish2.reviews.create(rate: 2, comments: "The pizza was ok")
review3 = dish3.reviews.create(rate: 1, comments: "The taco was bad")
review4 = dish4.reviews.create(rate: 1, comments: "The burrito  not good")