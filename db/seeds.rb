# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "faker"

User.destroy_all
Bike.destroy_all

puts "Created #{User.count} users"

User.create!(first_name: "Toutou", last_name: "dupont", email: "toutou@gmail.com", password: "azerty1")
file_user_1 = URI.parse("https://png.pngtree.com/png-clipart/20230927/original/pngtree-man-avatar-image-for-profile-png-image_13001877.png").open
user1 = User.all[0].photo.attach(io: file_user_1, filename: "user-1", content_type: "image/png")

User.create!(first_name: "Tonton", last_name: "dupont", email: "tonton@gmail.com", password: "azerty2")
file_user_2 = URI.parse("https://www.gtanf.com/forums/uploads/monthly_2018_12/avatar-artwork.thumb.jpg.52347ce581c909bdd8487ce4fc53fc95.jpg").open
user2 = User.all[1].photo.attach(io: file_user_2, filename: "user-2", content_type: "image/jpg")

users = User.all

user_id = users.map do |user|
  user.id
end

puts "#{User.count} Users are created"

puts "Created #{Bike.count} bikes"

4.times do
  Bike.create!(name: Faker::Name.name, content: Faker::Lorem.paragraph, rating: rand(0.0..5.0), price: rand(100..500), user_id: user_id.sample)
end

puts "#{Bike.count} bikes are created"

file_bike_1 = URI.parse("https://media.istockphoto.com/id/1415317051/fr/photo/v%C3%A9lo-%C3%A9lectrique-noir-isol%C3%A9-sur-fond-blanc.jpg?s=2048x2048&w=is&k=20&c=EPZrVjjCXbgfAPzV8SrcIphh_pY7JNam9j_ldxfwJk0=").open
bike1 = Bike.all[0].photo.attach(io: file_bike_1, filename: "bike-1", content_type: "image/jpg")

file_bike_2 = URI.parse("https://www.transitionvelo.com/content/uploads/2024/03/velo-tout-chemin-electrique-a-moteur-central-cadre-bas-e-actv-500-vert-1024x1024.jpg").open
bike2 = Bike.all[1].photo.attach(io: file_bike_2, filename: "bike-2", content_type: "image/jpg")

file_bike_3 = URI.parse("https://www.tomsguide.fr/content/uploads/sites/2/2023/11/Honda-velo-electrique-moto-prototype.jpg").open
bike3 = Bike.all[2].photo.attach(io: file_bike_3, filename: "bike-3", content_type: "image/jpg")

file_bike_4 = URI.parse("https://www.abicyclettepaulette.fr/cdn/shop/articles/DSC08082.jpg?v=1588155761&width=1100").open
bike4 = Bike.all[3].photo.attach(io: file_bike_4, filename: "bike-4", content_type: "image/jpg")
