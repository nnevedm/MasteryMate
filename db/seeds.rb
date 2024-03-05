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
User.destroy_all
Expert.destroy_all
Request.destroy_all
Offer.destroy_all
Field.destroy_all
puts "DB cleaned"

puts "... creating 15 expertises ..."

jobs = ["Home Maintenance", "Gardening and Landscaping", "Cooking and Baking", "DIY Projects and Crafts", "Technology Setup and Support", "Financial Planning", "Health and Fitness", "Art and Design", "Music and Performing Arts", "Language and Writing", "Sewing and Textile Crafts", "Photography and Videography", "Carpentry and Woodworking", "Automotive Maintenance", "Sustainability and Eco-living"]

jobs.each do |job|
  Field.create(expertise: job)
end

puts "... creating 6 users ..."

User.create(email: "thomas@yopmail.com", password: "123456")
User.create(email: "alice@example.com", password: "123456")
User.create(email: "bob@example.com", password: "123456")
User.create(email: "carol@example.com", password: "123456")
User.create(email: "david@example.com", password: "123456")
User.create(email: "emma@example.com", password: "123456")
