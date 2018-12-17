# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r1 = Restaurant.create(name: "Chipotle")
r2 = Restaurant.create(name: "5 guys")
user1 = User.create(username: "doug1", password: "123", email: "doug1@gmail.com")
user2 = User.create(username: "doug2", password: "123", email: "doug2@gmail.com")
review1 = r1.reviews.create(rating: 5, content: "Best food in town!")
review1.user = user1
review2 = r2.reviews.create(rating: 5, content: "If it wouldn't kill me to eat there everyday, I would!")
review2.user = user2
