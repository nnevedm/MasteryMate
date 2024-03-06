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
Review.destroy_all
ExpertField.destroy_all
Offer.destroy_all
Request.destroy_all
Expert.destroy_all
User.destroy_all
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

puts "... and 3 experts with their expertises ..."

expert1 = Expert.create!(description: "Involves basic repairs, upkeep, and general maintenance tasks around the house.", price_per_hour: 20, user: user1 )
expert2 = Expert.create!(description: "Focuses on outdoor plant care, garden setup, and landscape design.", price_per_hour: 26, user: user2 )
expert3 = Expert.create!(description: "Covers recipes, cooking techniques, meal planning, and baking.", price_per_hour: 19, user: user3 )

# caro: i have added this to check how it looks with many experts but we should improve !
expert1 = Expert.create!(description: "Involves basic repairs, upkeep, and general maintenance tasks around the house.", price_per_hour: 20, user: user1 )
expert2 = Expert.create!(description: "Focuses on outdoor plant care, garden setup, and landscape design.", price_per_hour: 26, user: user2 )
expert3 = Expert.create!(description: "Covers recipes, cooking techniques, meal planning, and baking.", price_per_hour: 19, user: user3 )
expert1 = Expert.create!(description: "Involves basic repairs, upkeep, and general maintenance tasks around the house.", price_per_hour: 20, user: user1 )
expert2 = Expert.create!(description: "Focuses on outdoor plant care, garden setup, and landscape design.", price_per_hour: 26, user: user2 )
expert3 = Expert.create!(description: "Covers recipes, cooking techniques, meal planning, and baking.", price_per_hour: 19, user: user3 )
expert1 = Expert.create!(description: "Involves basic repairs, upkeep, and general maintenance tasks around the house.", price_per_hour: 20, user: user1 )
expert2 = Expert.create!(description: "Focuses on outdoor plant care, garden setup, and landscape design.", price_per_hour: 26, user: user2 )
expert3 = Expert.create!(description: "Covers recipes, cooking techniques, meal planning, and baking.", price_per_hour: 19, user: user3 )
expert1 = Expert.create!(description: "Involves basic repairs, upkeep, and general maintenance tasks around the house.", price_per_hour: 20, user: user1 )
expert2 = Expert.create!(description: "Focuses on outdoor plant care, garden setup, and landscape design.", price_per_hour: 26, user: user2 )
expert3 = Expert.create!(description: "Covers recipes, cooking techniques, meal planning, and baking.", price_per_hour: 19, user: user3 )

ExpertField.create!(expert: expert1, field: expertise1)
ExpertField.create!(expert: expert1, field: expertise2)
ExpertField.create!(expert: expert2, field: expertise2)
ExpertField.create!(expert: expert2, field: expertise3)
ExpertField.create!(expert: expert3, field: expertise3)
ExpertField.create!(expert: expert3, field: expertise1)

puts "... creating 3 requests ..."

request1 = Request.create!(title: "Work in my garden", description: "Looking for a skilled individual to work in my garden. Tasks include planting, weeding, and general maintenance. Experience in gardening preferred. Flexible hours. Join me in creating a vibrant and flourishing outdoor space!", estimated_time: 4, address: "", status: "Pending", user: user4, expert: expert1)
request2 = Request.create!(title: "Transform my outdoor space", description: "I need someone to transform my outdoor space into a beautiful oasis. I want to learn and that our experienced team brings me creativity and expertise to enhance my garden's aesthetics. From planting to maintenance, my landscaping needs covered!", estimated_time: 6, address: "", status: "Pending", user: user5, expert: expert2)
request3 = Request.create!(title: "How to do a tiramisu?", description: "Looking for a skilled individual to prepare a delicious Tiramisu. Craving the perfect blend of coffee, mascarpone, and ladyfingers. If you have expertise in crafting this Italian dessert, please reach out. Compensation provided. Ready to savor the sweet delight!", estimated_time: 1, address: "", status: "Pending", user: user6, expert: expert3)

puts "... and 3 offers ..."

Offer.create!(content: "Hello, Carol. Thank you for considering my gardening services. I'm delighted to assist you in creating a vibrant outdoor space. I will propose you to work this week-end for 6 hours in the afternoon. There will be extra-costs for the hedge trimmer that I will bring to your place, but I offer you 1 our for first meeting. My price per hour is 24€. Have a nice day ! Thomas", occurs_on: Date.new(2024, 03, 15), time: 1, extra_costs: 10, reduction: 20, status: "Pending", request: request1)
Offer.create!(content: "Hello David, Thank you for considering my services. I'm thrilled to assist in transforming your outdoor space into a stunning oasis. Let's collaborate this weekend for 6 hours in the afternoon. The initial hour is on the house. My rate is 30€ per hour. Excited for our first meeting to discuss your landscaping dreams! Best regards, Alice", occurs_on: Date.new(2024, 03, 31), time: 1, extra_costs: 0, reduction: 30, status: "Pending", request: request2)
Offer.create!(content: "Hello Emma, Thank you for selecting me! I'm thrilled to assist you in creating the perfect Tiramisu. I propose dedicating this weekend to our venture, investing 1 delightful hour in the afternoon. My rate is 18€ per hour. Looking forward to our sweet collaboration! Best regards, Bob", occurs_on: Date.new(2024, 03, 17), time: 1, extra_costs: 0, reduction: 0, status: "Pending", request: request3)
