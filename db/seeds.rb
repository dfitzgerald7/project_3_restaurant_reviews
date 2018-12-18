# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r1 = Restaurant.create(name: "Chipotle")
r2 = Restaurant.create(name: "5 guys")
r3 = Restaurant.create(name: "Taco Bell")
r4 = Restaurant.create(name: "Outback")
user1 = User.create(username: "doug1", password: "123", email: "doug1@gmail.com")
user2 = User.create(username: "doug2", password: "123", email: "doug2@gmail.com")
user3 = User.create(username: "foodie1", password: "123", email: "foodie1@gmail.com")
review1 = r1.reviews.create(rating: 5, content: "Best food in town!", user_id: 1)
review2 = r2.reviews.create(rating: 5, content: "If it wouldn't kill me to eat there everyday, I would!", user_id: 2)
review2 = r3.reviews.create(rating: 1, content: "Gave me food poisoning!", user_id: 1)
review2 = r4.reviews.create(rating: 3, content: "The only thing that was good was the cheesy fries.", user_id: 3)
review2 = r4.reviews.create(rating: 1, content: "Horrible service! They didn't let me send my third steak back. Unacceptable!", user_id: 1)
review2 = r2.reviews.create(rating: 5, content: "5 stars for 5 guys.", user_id: 3)
