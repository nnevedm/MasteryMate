require "open-uri"



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

home = Field.create!(expertise: "Home Maintenance")
garden = Field.create!(expertise: "Gardening and Landscaping")
cook = Field.create!(expertise: "Cooking and Baking")
diy = Field.create!(expertise: "DIY Projects and Crafts")
tech = Field.create!(expertise: "Technology Setup and Support")
finance = Field.create!(expertise: "Financial Planning")
health = Field.create!(expertise: "Health and Fitness")
art = Field.create!(expertise: "Art and Design")
music = Field.create!(expertise: "Music and Performing Arts")
language = Field.create!(expertise: "Language and Writing")
sewing = Field.create!(expertise: "Sewing and Textile Crafts")
photo = Field.create!(expertise: "Photography and Videography")
carpentry = Field.create!(expertise: "Carpentry and Woodworking")
auto = Field.create!(expertise: "Automotive Maintenance")
sustainability = Field.create!(expertise: "Sustainability and Eco-living")


puts "... creating users and experts 1-3 ..."

user1 = User.new(email: "thomas@yopmail.com", password: "123456", first_name: "Thomas", last_name: "Casper", address: "Maasstraat 55, 2300 Turnhout")
avatar = URI.open("https://media.istockphoto.com/id/690299268/photo/work-that-dirt-save-the-earth.jpg?s=612x612&w=0&k=20&c=yPX2VPWOF-c0nopsbdOQHFHHo14J0zU0rmkp-G_RTd4=")
user1.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user1.save!

expert_description = "I'm Thomas, and I specialize in home maintenance and gardening. With years of hands-on experience, I'm here to help you become proficient in these areas. From fixing that leaky faucet to creating your dream garden, I'll guide you every step of the way. Let's work together to enhance your home and outdoor spaces!"
expert1 = Expert.create!(description: expert_description, price_per_hour: 20, user: user1)
ExpertField.create!(expert: expert1, field: home)
ExpertField.create!(expert: expert1, field: garden)



user2 = User.new(email: "alice@example.com", password: "123456", first_name: "Alice", last_name: "Smith", address: "Rue du Soldat Larivière 17, 1370 Jodoigne")
avatar = URI.open("https://lombardo-homes-images.s3.amazonaws.com/wp-content/uploads/2023/02/21144808/women-home-diy.jpg")
user2.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user2.save!

expert_description = "I'm Alice, your go-to expert for DIY. With my passion for creativity and knack for craftsmanship, I'll help you unleash your inner artist. From simple home decor to personalized gifts, I'll empower you with the skills and inspiration to bring your ideas to life. Let's get crafting!"
expert2 = Expert.create!(description: expert_description, price_per_hour: 26, user: user2)
ExpertField.create!(expert: expert2, field: diy)



user3 = User.new(email: "bob@example.com", password: "123456", first_name: "Bob", last_name: "Johnson", address: "Het Hof 25, 3580 Beringen")
avatar = URI.open("https://t3.ftcdn.net/jpg/05/40/69/30/360_F_540693010_gAzpekRy6lOjOQJYptcqZSpmDOToGTSk.jpg")
user3.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user3.save!

expert_description = "I'm a versatile coach in both Music and Performing Arts as well as Language and Writing. With a passion for artistic expression and effective communication, I'm here to help you explore the realms of creativity and language. Whether you're refining your musical skills on an instrument or honing your writing craft, I offer personalized guidance tailored to your goals and interests. Let's embark on a journey of self-expression and growth through the power of music, performance, language, and writing!"
expert3 = Expert.create!(description: expert_description, price_per_hour: 19, user: user3)
ExpertField.create!(expert: expert3, field: music)
ExpertField.create!(expert: expert3, field: language)


puts "... creating users and experts 4-6 ..."


user4 = User.new(email: "carol@example.com", password: "123456", first_name: "Carol", last_name: "Williams", address: "Rue de la Malaise 26, 1340 Ottignies-Louvain-la-Neuve")
avatar = URI.open("https://www.india.com/wp-content/uploads/2018/03/Yoga-for-women.jpg")
user4.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user4.save!

expert_description = "I'm Carol, your multifaceted guide! With a deep commitment to holistic well-being and sustainable living practices, I'm here to empower you to lead a healthier, more eco-conscious lifestyle. Whether you're learning to reduce your carbon footprint, mastering the art of sewing and crafting with textiles, or striving to improve your fitness and well-being, I offer comprehensive support and expertise. Let's work together to create a healthier, more sustainable world while nurturing your creativity and vitality!"
expert4 = Expert.create!(description: expert_description, price_per_hour: 15, user: user4)
ExpertField.create!(expert: expert4, field: sustainability)
ExpertField.create!(expert: expert4, field: sewing)
ExpertField.create!(expert: expert4, field: health)



user5 = User.new(email: "david@example.com", password: "123456", first_name: "David", last_name: "Brown", address: "Val du Bronze 7, 6980 La Roche-en-Ardenne")
avatar = URI.open("https://img.freepik.com/free-photo/handsome-man-driving-his-car_1303-23084.jpg")
user5.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user5.save!

expert_description = "With years of experience under the hood, I'm here to help you understand the ins and outs of car care. From routine maintenance to troubleshooting, I'll provide you with the knowledge and skills to keep your vehicle running smoothly. Let's hit the road with confidence!"
expert5 = Expert.create!(description: expert_description, price_per_hour: 18, user: user5)
ExpertField.create!(expert: expert5, field: auto)



user6 = User.new(email: "emma@example.com", password: "123456", first_name: "Emma", last_name: "Jones", address: "Osylei 74, 2640 Mortsel")
avatar = URI.open("https://media.istockphoto.com/id/1365606637/photo/shot-of-a-young-businesswoman-using-a-digital-tablet-while-at-work.jpg?s=612x612&w=0&k=20&c=KUjVloBUXtcZzNjGyyiRFlplVuuPE6Tap3OL6h_xI5k=")
user6.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user6.save!

expert_description = "Whether it's setting up your new gadgets, troubleshooting tech issues, or staying updated with the latest innovations, I'm here to guide you every step of the way. Let's harness the power of technology together!"
expert6 = Expert.create!(description: expert_description, price_per_hour: 21, user: user6)
ExpertField.create!(expert: expert6, field: tech)




puts "... creating 3 requests ..."

# we will need to check this works fine! no view yet so I can't check

request1 = Request.new(title: "Work in my garden", description: "Looking for a skilled individual to work in my garden. Tasks include planting, weeding, and general maintenance. Experience in gardening preferred. Flexible hours. Join me in creating a vibrant and flourishing outdoor space!", estimated_time: 4, address: "", status: "Pending", user: user4, expert: expert1)
picture = URI.open("https://www.cardiff-times.co.uk/wp-content/uploads/2020/08/Jamie-w-scaled.jpg")
request1.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
request1.save!


request2 = Request.new(title: "Transform my outdoor space", description: "I need someone to transform my outdoor space into a beautiful oasis. Here is a picture now, and what I would like my garden to look like. I want to learn and that our experienced team brings me creativity and expertise to enhance my garden's aesthetics. From planting to maintenance, my landscaping needs covered!", estimated_time: 6, address: "", status: "Pending", user: user5, expert: expert2)
picture = URI.open("https://paridevati.files.wordpress.com/2015/04/15041908.jpg")
request2.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
picture = URI.open("https://cdn.britannica.com/42/91642-050-332E5C66/Keukenhof-Gardens-Lisse-Netherlands.jpg")
request2.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
request2.save!


request3 = Request.new(title: "How to do a tiramisu?", description: "Looking for a skilled individual to prepare a delicious Tiramisu. Craving the perfect blend of coffee, mascarpone, and ladyfingers. If you have expertise in crafting this Italian dessert, please reach out. Compensation provided. Ready to savor the sweet delight!", estimated_time: 1, address: "", status: "Pending", user: user6, expert: expert3)



# I made very quick request for testing, need to improve

request6 = Request.new(title: "a new request", description: "hihihihiihihih hahahahahaha ohohohoohohohoho", estimated_time: 5, address: "", status: "Pending", user: user5, expert: expert1)
picture = URI.open("https://source.unsplash.com/random/?home")
request6.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
picture = URI.open("https://source.unsplash.com/random/?pool")
request6.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
request6.save!

request7 = Request.new(title: "another new request", description: "bblablalaballazabmab blublublyb bblablalaballazabmab blublublyb bblablalaballazabmab blublublyb bblablalaballazabmab blublublyb", estimated_time: 2, address: "", status: "Pending", user: user5, expert: expert4)
picture = URI.open("https://source.unsplash.com/random/?wood")
request7.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
picture = URI.open("https://source.unsplash.com/random/?hey")
request7.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
request7.save!




puts "... and 3 offers ..."

Offer.create!(content: "Hello, Carol. Thank you for considering my gardening services. I'm delighted to assist you in creating a vibrant outdoor space. I will propose you to work this week-end for 6 hours in the afternoon. There will be extra-costs for the hedge trimmer that I will bring to your place, but I offer you 1 our for first meeting. My price per hour is 24€. Have a nice day ! Thomas", occurs_on: Date.new(2024, 03, 15), time: 1, extra_costs: 10, reduction: 20, status: "Pending", request: request1)
Offer.create!(content: "Hello David, Thank you for considering my services. I'm thrilled to assist in transforming your outdoor space into a stunning oasis. Let's collaborate this weekend for 6 hours in the afternoon. The initial hour is on the house. My rate is 30€ per hour. Excited for our first meeting to discuss your landscaping dreams! Best regards, Alice", occurs_on: Date.new(2024, 03, 31), time: 1, extra_costs: 0, reduction: 30, status: "Pending", request: request2)
Offer.create!(content: "Hello Emma, Thank you for selecting me! I'm thrilled to assist you in creating the perfect Tiramisu. I propose dedicating this weekend to our venture, investing 1 delightful hour in the afternoon. My rate is 18€ per hour. Looking forward to our sweet collaboration! Best regards, Bob", occurs_on: Date.new(2024, 03, 17), time: 1, extra_costs: 0, reduction: 0, status: "Pending", request: request3)
