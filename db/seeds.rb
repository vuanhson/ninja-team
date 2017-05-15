# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Start Seed"

User.create email: "toantoan@gmail.com", password: "asdasdasd", password_confirmation: "asdasdasd", user_name: "toantoan"
User.create email: "nganga@gmail.com", password: "asdasdasd", password_confirmation: "asdasdasd", user_name: "nganga"

100.times do
	User.create email: Faker::Internet.email, password: "123123123", password_confirmation: "123123123", user_name: Faker::Name.name , address: Faker::Address.street_address
end

puts "Finish Seed"
users = User.all
user  = users.first
following = users[2..50]
followers = users[2..40]
following.each { |followed| user.follow(followed) }
