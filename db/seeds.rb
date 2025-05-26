# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'



10.times do
  puts "create user"
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "azerty", email: Faker::Internet.email, birthday: Faker::Date.birthday(min_age: 18, max_age: 65) )
  puts "first user"
  user2 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "azerty", email: Faker::Internet.email, birthday: Faker::Date.birthday(min_age: 18, max_age: 65) )
puts "2 user"
  friend = FriendProfile.create!(username: Faker::Internet.username, interest: Faker::Lorem.paragraph, day_rate: 10.2, user: user )
 puts "friend"
  Booking.create!(start_date: Faker::Date.in_date_period, end_date: Faker::Date.in_date_period, user: user2, friend_profile: friend  )
puts "booking"
end
