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
require "json"
require "open-uri"
require 'net/http'

print "start destroy"
User.destroy_all
FriendProfile.destroy_all
Booking.destroy_all
Hobbie.destroy_all
print "succesfully destroyed"

print "start hobbies"
10.times do
uri = URI('https://api.api-ninjas.com/v1/hobbies')
request = Net::HTTP::Get.new(uri)
request["X-Api-Key"] = ENV["API_NINJAS_KEY"]
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
response = http.request(request)
data = JSON.parse(response.body)
  Hobbie.create!(name: data["hobby"])
end
print "succesfully seeded hobbies"

print "start seed"
10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "azerty", email: Faker::Internet.email, birthday: Faker::Date.birthday(min_age: 18, max_age: 65) )
  user2 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "azerty", email: Faker::Internet.email, birthday: Faker::Date.birthday(min_age: 18, max_age: 65) )
  friend = FriendProfile.create!(username: Faker::Internet.username, hobbies: Hobbie.all.sample(rand(1..3)), day_rate: rand(0.0..15.0), user: user )
  Booking.create!(start_date: Faker::Date.in_date_period, end_date: Faker::Date.in_date_period, user: user2, friend_profile: friend  )
end
print "succesfully seeded"

