# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning DB ..."
ExpertField.destroy_all
Expert.destroy_all
User.destroy_all
Request.destroy_all
Offer.destroy_all
Field.destroy_all
puts "DB cleaned"

puts "... creating 15 expertises ..."

expertise1 = Field.create!(expertise: "Home Maintenance")
expertise2 = Field.create!(expertise: "Gardening and Landscaping")
expertise3 = Field.create!(expertise: "Cooking and Baking")

jobs = ["DIY Projects and Crafts", "Technology Setup and Support", "Financial Planning", "Health and Fitness", "Art and Design", "Music and Performing Arts", "Language and Writing", "Sewing and Textile Crafts", "Photography and Videography", "Carpentry and Woodworking", "Automotive Maintenance", "Sustainability and Eco-living"]
jobs.each do |job|
  Field.create!(expertise: job)
end

puts "... creating 6 users ..."

user1 = User.create!(email: "thomas@yopmail.com", password: "123456", first_name: "Thomas", last_name: "Casper", address: "Maasstraat 55, 2300 Turnhout")
user2 = User.create!(email: "alice@example.com", password: "123456", first_name: "Alice", last_name: "Smith", address: "Rue du Soldat Larivière 17, 1370 Jodoigne")
user3 = User.create!(email: "bob@example.com", password: "123456", first_name: "Bob", last_name: "Johnson", address: "Het Hof 25, 3580 Beringen")
user4 = User.create!(email: "carol@example.com", password: "123456", first_name: "Carol", last_name: "Williams", address: "Rue de la Malaise 26, 1340 Ottignies-Louvain-la-Neuve")
user5 = User.create!(email: "david@example.com", password: "123456", first_name: "David", last_name: "Brown", address: "Val du Bronze 7, 6980 La Roche-en-Ardenne")
user6 = User.create!(email: "emma@example.com", password: "123456", first_name: "Emma", last_name: "Jones", address: "Osylei 74, 2640 Mortsel")

expert1 = Expert.create!(description: "Involves basic repairs, upkeep, and general maintenance tasks around the house.", price_per_hour: 20, user: user1 )
expert2 = Expert.create!(description: "Focuses on outdoor plant care, garden setup, and landscape design.", price_per_hour: 26, user: user2 )
expert3 = Expert.create!(description: "Covers recipes, cooking techniques, meal planning, and baking.", price_per_hour: 19, user: user3 )

ExpertField.create!(expert: expert1, field: expertise1)
ExpertField.create!(expert: expert1, field: expertise2)
ExpertField.create!(expert: expert2, field: expertise2)
ExpertField.create!(expert: expert3, field: expertise3)

Request.create(title: "Work in my garden", description: "Looking for a skilled individual to work in my garden. Tasks include planting, weeding, and general maintenance. Experience in gardening preferred. Flexible hours. Join me in creating a vibrant and flourishing outdoor space!")
