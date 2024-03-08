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



puts "... creating user 0 ..."

user0 = User.new(email: "sophie@yopmail.com", password: "123456", first_name: "Sophie", last_name: "Lamarche", address: "Rue de Rome 9, 1060 Saint-Gilles", phone_number: "0468799972")
avatar = URI.open("https://www.perfocal.com/blog/content/images/size/w960/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg")
user0.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user0.save!

puts "... creating experts 1-3 ..."

user1 = User.new(email: "thomas@yopmail.com", password: "123456", first_name: "Thomas", last_name: "Casper", address: "Maasstraat 55, 2300 Turnhout", phone_number: "0468798973")
avatar = URI.open("https://media.istockphoto.com/id/690299268/photo/work-that-dirt-save-the-earth.jpg?s=612x612&w=0&k=20&c=yPX2VPWOF-c0nopsbdOQHFHHo14J0zU0rmkp-G_RTd4=")
user1.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user1.save!

expert_description = "I'm Thomas, and I specialize in home maintenance and gardening. With years of hands-on experience, I'm here to help you become proficient in these areas. From fixing that leaky faucet to creating your dream garden, I'll guide you every step of the way. Let's work together to enhance your home and outdoor spaces!"
expert1 = Expert.create!(description: expert_description, price_per_hour: 24, user: user1)
ExpertField.create!(expert: expert1, field: home)
ExpertField.create!(expert: expert1, field: garden)



user2 = User.new(email: "alice@yopmail.com", password: "123456", first_name: "Alice", last_name: "Smith", address: "Rue du Soldat Larivière 17, 1370 Jodoigne", phone_number: "0468797974")
avatar = URI.open("https://lombardo-homes-images.s3.amazonaws.com/wp-content/uploads/2023/02/21144808/women-home-diy.jpg")
user2.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user2.save!

expert_description = "I'm Alice, your go-to expert for DIY. With my passion for creativity and knack for craftsmanship, I'll help you unleash your inner artist. From simple home decor to personalized gifts, I'll empower you with the skills and inspiration to bring your ideas to life. Let's get crafting!"
expert2 = Expert.create!(description: expert_description, price_per_hour: 30, user: user2)
ExpertField.create!(expert: expert2, field: diy)



user3 = User.new(email: "bob@yopmail.com", password: "123456", first_name: "Bob", last_name: "Johnson", address: "Het Hof 25, 3580 Beringen", phone_number: "0468796975")
avatar = URI.open("https://t3.ftcdn.net/jpg/05/40/69/30/360_F_540693010_gAzpekRy6lOjOQJYptcqZSpmDOToGTSk.jpg")
user3.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user3.save!

expert_description = "I'm a versatile coach in both Music and Performing Arts as well as Language and Writing. With a passion for artistic expression and effective communication, I'm here to help you explore the realms of creativity and language. Whether you're refining your musical skills on an instrument or honing your writing craft, I offer personalized guidance tailored to your goals and interests. Let's embark on a journey of self-expression and growth through the power of music, performance, language, and writing!"
expert3 = Expert.create!(description: expert_description, price_per_hour: 18, user: user3)
ExpertField.create!(expert: expert3, field: music)
ExpertField.create!(expert: expert3, field: language)


puts "... creating users and experts 4-6 ..."


user4 = User.new(email: "carol@yopmail.com", password: "123456", first_name: "Carol", last_name: "Williams", address: "Rue de la Malaise 26, 1340 Ottignies-Louvain-la-Neuve", phone_number: "0468795976")
avatar = URI.open("https://www.india.com/wp-content/uploads/2018/03/Yoga-for-women.jpg")
user4.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user4.save!

expert_description = "I'm Carol, your multifaceted guide! With a deep commitment to holistic well-being and sustainable living practices, I'm here to empower you to lead a healthier, more eco-conscious lifestyle. Whether you're learning to reduce your carbon footprint, mastering the art of sewing and crafting with textiles, or striving to improve your fitness and well-being, I offer comprehensive support and expertise. Let's work together to create a healthier, more sustainable world while nurturing your creativity and vitality!"
expert4 = Expert.create!(description: expert_description, price_per_hour: 21, user: user4)
ExpertField.create!(expert: expert4, field: sustainability)
ExpertField.create!(expert: expert4, field: sewing)
ExpertField.create!(expert: expert4, field: health)



user5 = User.new(email: "david@yopmail.com", password: "123456", first_name: "David", last_name: "Brown", address: "Val du Bronze 7, 6980 La Roche-en-Ardenne", phone_number: "0468794977")
avatar = URI.open("https://img.freepik.com/free-photo/handsome-man-driving-his-car_1303-23084.jpg")
user5.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user5.save!

expert_description = "With years of experience under the hood, I'm here to help you understand the ins and outs of car care. From routine maintenance to troubleshooting, I'll provide you with the knowledge and skills to keep your vehicle running smoothly. Let's hit the road with confidence!"
expert5 = Expert.create!(description: expert_description, price_per_hour: 23, user: user5)
ExpertField.create!(expert: expert5, field: auto)
ExpertField.create!(expert: expert5, field: home)



user6 = User.new(email: "emma@yopmail.com", password: "123456", first_name: "Emma", last_name: "Jones", address: "Osylei 74, 2640 Mortsel", phone_number: "0468799978")
avatar = URI.open("https://media.istockphoto.com/id/1365606637/photo/shot-of-a-young-businesswoman-using-a-digital-tablet-while-at-work.jpg?s=612x612&w=0&k=20&c=KUjVloBUXtcZzNjGyyiRFlplVuuPE6Tap3OL6h_xI5k=")
user6.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user6.save!

expert_description = "Whether it's setting up your new gadgets, troubleshooting tech issues, or staying updated with the latest innovations, I'm here to guide you every step of the way. Let's harness the power of technology together!"
expert6 = Expert.create!(description: expert_description, price_per_hour: 21, user: user6)
ExpertField.create!(expert: expert6, field: tech)

puts "... creating users and experts 7-9 ..."

# Example 7

user7 = User.new(email: "pauline@yopmail.com", password: "pauline_pass", first_name: "Pauline", last_name: "Thompson", address: "Sunset Boulevard 789, 90210 Hollywood", phone_number: "0468793979")
avatar7 = URI.open("https://www.shutterstock.com/image-photo/woman-smiling-tropical-fruit-salad-260nw-360191873.jpg")
user7.photo.attach(io: avatar7, filename: "pauline_profile.jpg", content_type: "image/jpg")
user7.save!

expert_description7 = "Greetings! I'm Pauline, a nutrition expert passionate about creating personalized meal plans to help you achieve your health goals. Let's embark on a journey to a healthier lifestyle together!"
expert7 = Expert.create!(description: expert_description7, price_per_hour: 35, user: user7)
ExpertField.create!(expert: expert7, field: health)


# Example 8
user8 = User.new(email: "jackson@yopmail.com", password: "jackson_pass", first_name: "Jackson", last_name: "Johnson", address: "Maple Street 456, 54321 Cityville", phone_number: "0468792980")
avatar8 = URI.open("https://i.pinimg.com/736x/d7/28/03/d728039c334a586b0fe88881b435b82c.jpg")
user8.photo.attach(io: avatar8, filename: "jackson_profile.jpg", content_type: "image/jpg")
user8.save!

expert_description8 = "Hello, I'm Jackson, a photography enthusiast. Whether it's capturing special moments or providing tips on enhancing your photography skills, I'm here to share my passion with you!"
expert8 = Expert.create!(description: expert_description8, price_per_hour: 28, user: user8)
ExpertField.create!(expert: expert8, field: photo)
ExpertField.create!(expert: expert8, field: art)

# Example 9
user9 = User.new(email: "olivia@yopmail.com", password: "olivia_pass", first_name: "Olivia", last_name: "Davis", address: "Grove Street 789, 45678 Suburbia", phone_number: "0468791981")
avatar9 = URI.open("https://news.gsu.edu/files/2019/05/PantherProfileNatsai_Ndebele_01.jpg")
user9.photo.attach(io: avatar9, filename: "olivia_profile.jpg", content_type: "image/jpg")
user9.save!

expert_description9 = "Hi, I'm Olivia, a tech enthusiast. From troubleshooting to setting up devices, I'm here to make technology user-friendly for you. Let's navigate the digital world together!"
expert9 = Expert.create!(description: expert_description9, price_per_hour: 30, user: user9)
ExpertField.create!(expert: expert9, field: tech)
ExpertField.create!(expert: expert9, field: diy)

puts "... creating users and experts 10-12 ..."

# Example 10
user10 = User.new(email: "grace@yopmail.com", password: "grace_pass", first_name: "Grace", last_name: "Taylor", address: "Cedar Lane 987, 34567 Uptown", phone_number: "0468790982")
avatar10 = URI.open("https://www.shutterstock.com/image-photo/profile-side-photo-cute-sweet-260nw-1552221215.jpg")
user10.photo.attach(io: avatar10, filename: "grace_profile.jpg", content_type: "image/jpg")
user10.save!

expert_description10 = "Hey there! I'm Grace, a professional chef passionate about creating culinary masterpieces. Let's embark on a flavorful journey and elevate your cooking skills together!"
expert10 = Expert.create!(description: expert_description10, price_per_hour: 50, user: user10)
ExpertField.create!(expert: expert10, field: cook)

# Example 11
user11 = User.new(email: "marcus@yopmail.com", password: "marcus_pass", first_name: "Marcus", last_name: "Baker", address: "Cherry Avenue 123, 45678 Downtown", phone_number: "0468895983")
avatar11 = URI.open("https://as1.ftcdn.net/v2/jpg/06/05/11/12/1000_F_605111295_QyQY4Tk7bv8789bFA0TgGKeTM4zzowdo.jpg")
user11.photo.attach(io: avatar11, filename: "marcus_profile.jpg", content_type: "image/jpg")
user11.save!

expert_description11 = "Hello, I'm Marcus, an experienced and financial software developer. Whether it's coding challenges and project guidance, I'm here to help you navigate the world of programming. Let's code together!"
expert11 = Expert.create!(description: expert_description11, price_per_hour: 45, user: user11)
ExpertField.create!(expert: expert11, field: tech)
ExpertField.create!(expert: expert11, field: finance)

# Example 12
user12 = User.new(email: "isabella@yopmail.com", password: "isabella_pass", first_name: "Isabella", last_name: "Woods", address: "Birch Street 789, 23456 Village", phone_number: "0467790984")
avatar12 = URI.open("https://i1.feedspot.com/original/5595735.jpg")
user12.photo.attach(io: avatar12, filename: "isabella_profile.jpg", content_type: "image/jpg")
user12.save!

expert_description12 = "Hi, I'm Isabella, a sewing enthusiast. From stitching basics to advanced techniques, I'm here to guide you through the world of sewing and textile crafts. Let's create something beautiful together!"
expert12 = Expert.create!(description: expert_description12, price_per_hour: 30, user: user12)
ExpertField.create!(expert: expert12, field: sewing)
ExpertField.create!(expert: expert12, field: diy)

puts "... creating users and experts 13-15 ..."

# Example 13
user13 = User.new(email: "michael@yopmail.com", password: "michael_pass", first_name: "Michael", last_name: "Smith", address: "Oakwood Avenue 456, 34567 Uptown", phone_number: "0468294985")
avatar13 = URI.open("https://previews.123rf.com/images/dolgachov/dolgachov1611/dolgachov161102560/65205804-concept-de-service-de-r%C3%A9paration-d-entretien-et-de-personnes-m%C3%A9canicien-automobile.jpg")
user13.photo.attach(io: avatar13, filename: "michael_profile.jpg", content_type: "image/jpg")
user13.save!

expert_description13 = "Hello, I'm Michael, an automotive enthusiast. Whether it's routine maintenance or troubleshooting issues, I'm here to help you keep your vehicle running smoothly. Let's hit the road together!"
expert13 = Expert.create!(description: expert_description13, price_per_hour: 40, user: user13)
ExpertField.create!(expert: expert13, field: auto)

# Example 14
user14 = User.new(email: "julia@yopmail.com", password: "julia_pass", first_name: "Julia", last_name: "Miller", address: "Maple Lane 123, 78901 Countryside", phone_number: "0469095986")
avatar14 = URI.open("https://eco-business.imgix.net/uploads/ebmedia/fileuploads/9038731798_3f3e8c82f8_k.jpg?fit=crop&h=960&ixlib=django-1.2.0&w=1440")
user14.photo.attach(io: avatar14, filename: "julia_profile.jpg", content_type: "image/jpg")
user14.save!

expert_description14 = "Hi, I'm Julia, a sustainability advocate. From eco-friendly living tips to implementing sustainable practices, I'm here to guide you on the path to a greener lifestyle. Let's make a positive impact together!"
expert14 = Expert.create!(description: expert_description14, price_per_hour: 35, user: user14)
ExpertField.create!(expert: expert14, field: sustainability)

# Example 15
user15 = User.new(email: "daniel@yopmail.com", password: "daniel_pass", first_name: "Daniel", last_name: "Williams", address: "Chestnut Street 789, 23456 Village", phone_number: "0468096987")
avatar15 = URI.open("https://i.pinimg.com/736x/dd/d5/3d/ddd53d45a55decf598d7b7149eea1389.jpg")
user15.photo.attach(io: avatar15, filename: "daniel_profile.jpg", content_type: "image/jpg")
user15.save!

expert_description15 = "Greetings! I'm Daniel, a music enthusiast. Whether it's playing instruments or exploring the world of music theory, I'm here to share my passion and help you discover your musical journey. Let's make beautiful melodies together!"
expert15 = Expert.create!(description: expert_description15, price_per_hour: 30, user: user15)
ExpertField.create!(expert: expert15, field: music)

puts "... creating users and experts 16-19 ..."

# Example 16
user16 = User.new(email: "oliver@yopmail.com", password: "oliver_pass", first_name: "Oliver", last_name: "Johnson", address: "Sycamore Lane 987, 12345 Uptown", phone_number: "0468479988")
avatar16 = URI.open("https://www.shutterstock.com/image-photo/english-course-happy-asian-male-260nw-2196465085.jpg")
user16.photo.attach(io: avatar16, filename: "oliver_profile.jpg", content_type: "image/jpg")
user16.save!

expert_description16 = "Hi, I'm Oliver, a language tutor. Whether you're brushing up on your vocabulary or aiming for fluency, I'm here to make your language learning journey enjoyable and effective. Let's explore new languages together!"
expert16 = Expert.create!(description: expert_description16, price_per_hour: 25, user: user16)
ExpertField.create!(expert: expert16, field: language)

# Example 17
user17 = User.new(email: "amelia@yopmail.com", password: "amelia_pass", first_name: "Amelia", last_name: "Taylor", address: "Birch Lane 456, 67890 Downtown", phone_number: "0468350989")
avatar17 = URI.open("https://i.pinimg.com/236x/31/a0/8f/31a08fd9583da3bd1fd73f2b30ac9c00.jpg")
user17.photo.attach(io: avatar17, filename: "amelia_profile.jpg", content_type: "image/jpg")
user17.save!

expert_description17 = "Greetings! I'm Amelia, a graphic designer with a passion for creating visual identities. Whether it's logos, branding, or digital art, I'm here to turn your vision into stunning visuals. Let's design together!"
expert17 = Expert.create!(description: expert_description17, price_per_hour: 35, user: user17)
ExpertField.create!(expert: expert17, field: art)
ExpertField.create!(expert: expert17, field: diy)

# Example 18
user18 = User.new(email: "mila@yopmail.com", password: "mila_pass", first_name: "Mila", last_name: "Harris", address: "Cedar Avenue 789, 23456 Village", phone_number: "0468939790")
avatar18 = URI.open("https://img.freepik.com/free-photo/young-happy-woman-making-bruschetta-while-preparing-food-kitchen_637285-3108.jpg")
user18.photo.attach(io: avatar18, filename: "mila_profile.jpg", content_type: "image/jpg")
user18.save!

expert_description18 = "Hello, I'm Mila, a cooking enthusiast. From mastering culinary techniques to exploring diverse cuisines, I'm here to help you become a confident home chef. Let's cook up some delicious experiences together!"
expert18 = Expert.create!(description: expert_description18, price_per_hour: 30, user: user18)
ExpertField.create!(expert: expert18, field: cook)

# Example 19
user19 = User.new(email: "george@yopmail.com", password: "george_pass", first_name: "George", last_name: "Harris", address: "Cedar Avenue 789, 23456 Village", phone_number: "0468490891")
avatar19 = URI.open("https://media.istockphoto.com/id/934807334/photo/hardworking-carpenter-polishing-wood-using-abrasive-paper.jpg?s=612x612&w=0&k=20&c=k0-jRN-Wi4f1exo3an-eDWi_IAOcR5yXJxtqDnZx2kI=")
user19.photo.attach(io: avatar19, filename: "george_profile.jpg", content_type: "image/jpg")
user19.save!

# Example Carpenter Description
expert_description19 = "Greetings! I'm George, a skilled carpenter with a passion for crafting wood into functional and beautiful creations. Whether it's custom furniture, intricate woodwork, or home renovations, I'm here to bring your ideas to life. Let's build something extraordinary together!"
expert19 = Expert.create!(description: expert_description19, price_per_hour: 28, user: user19)
ExpertField.create!(expert: expert19, field: carpentry)








puts "... creating 7 requests ..."

# we will need to check this works fine! no view yet so I can't check

request1 = Request.new(title: "Work in my garden", description: "Looking for a skilled individual to work in my garden. Tasks include planting, weeding, and general maintenance. Experience in gardening preferred. Flexible hours. Join me in creating a vibrant and flourishing outdoor space!", estimated_time: 4, address: "", status: "Offer made", user: user0, expert: expert1)
picture = URI.open("https://www.cardiff-times.co.uk/wp-content/uploads/2020/08/Jamie-w-scaled.jpg")
request1.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
request1.save!


request2 = Request.new(title: "Transform my outdoor", description: "I need someone to transform my outdoor space into a beautiful oasis. Here is a picture now, and what I would like my garden to look like. I want to learn and that our experienced team brings me creativity and expertise to enhance my garden's aesthetics. From planting to maintenance, my landscaping needs covered!", estimated_time: 6, address: "", status: "Offer accepted", user: user0, expert: expert2)
picture = URI.open("https://paridevati.files.wordpress.com/2015/04/15041908.jpg")
request2.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
picture = URI.open("https://cdn.britannica.com/42/91642-050-332E5C66/Keukenhof-Gardens-Lisse-Netherlands.jpg")
request2.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
request2.save!


request3 = Request.new(title: "How to do a tiramisu?", description: "Looking for a skilled individual to prepare a delicious Tiramisu. Craving the perfect blend of coffee, mascarpone, and ladyfingers. If you have expertise in crafting this Italian dessert, please reach out. Compensation provided. Ready to savor the sweet delight!", estimated_time: 1, address: "", status: "Offer accepted", user: user15, expert: expert1)
request3.save!


request4 = Request.new(title: "Garden maintenance", description: "Looking for a skilled individual to work in my garden. Tasks include planting, weeding, and general maintenance. Experience in gardening preferred. Flexible hours. Join me in creating a vibrant and flourishing outdoor space!", estimated_time: 3, address: "", status: "Pending", user: user0, expert: expert1)
request4.save!

request5 = Request.new(title: "building my outdoor", description: "I need someone to transform my outdoor space into a beautiful oasis. Here is a picture now, and what I would like my garden to look like. I want to learn and that our experienced team brings me creativity and expertise to enhance my garden's aesthetics. From planting to maintenance, my landscaping needs covered!", estimated_time: 6, address: "", status: "Pending", user: user0, expert: expert2)
request5.save!


# I made very quick request for testing, need to improve

request6 = Request.new(title: "Change my stairs", description: "Hello ! I want to build a new stairs at my place. It needs to be in wood and I need an expert with this compentence. I think there is work for like 1 week. The stairs will have 16 steps and it will be curved.", estimated_time: 60, address: "", status: "Pending", user: user0, expert: expert19)
picture = URI.open("https://images.unsplash.com/photo-1579625224541-baaba72b3f06?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c3RhaXJzfHx8fHx8MTcwOTg5MTY3Mg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080")
request6.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
picture = URI.open("https://images.unsplash.com/photo-1521311394770-4cbf8c2508bb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c3RhaXJzLXdvb2R8fHx8fHwxNzA5ODkxNzY1&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080")
request6.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
request6.save!

request7 = Request.new(title: "Help for cutting wood", description: "Hello, I need someone to teach me how to cut wood. I don't have the experience and the material to do it. I have 20 steles of wood to cut in my garden, I think it will take all afternoon.", estimated_time: 5, address: "", status: "Pending", user: user0, expert: expert1)
picture = URI.open("https://images.unsplash.com/photo-1564250242370-ba316ca2188f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8d29vZHx8fHx8fDE3MDk4OTE4MjA&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080")
request7.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
request7.save!




puts "... and 3 offers ..."

Offer.create!(content: "Hello Sophie, Thank you for considering my gardening services. I'm delighted to assist you in creating a vibrant outdoor space. I will propose you to work this week-end for 6 hours in the afternoon. There will be extra-costs for the hedge trimmer that I will bring to your place, but I offer you 1 our for first meeting. My price per hour is 24€. Have a nice day ! \nBest regards, \n\nThomas", occurs_on: Date.new(2024, 03, 15), time: 2, extra_costs: 10, reduction: 20, status: "Offer made", request: request1)
Offer.create!(content: "Hello Sophie, Thank you for considering my services. I'm thrilled to assist in transforming your outdoor space into a stunning oasis. Let's collaborate this weekend for 6 hours in the afternoon. The initial hour is on the house. My rate is 30€ per hour. Excited for our first meeting to discuss your landscaping dreams! Best regards, Alice", occurs_on: Date.new(2024, 03, 31), time: 1, extra_costs: 0, reduction: 10, status: "Offer made", request: request2)
Offer.create!(content: "Hello Sophie, Thank you for selecting me! I'm thrilled to assist you in creating the perfect Tiramisu. I propose dedicating this weekend to our venture, investing 1 delightful hour in the afternoon. My rate is 18€ per hour. Looking forward to our sweet collaboration! Best regards, Bob", occurs_on: Date.new(2024, 03, 17), time: 1, extra_costs: 5, reduction: 0, status: "Offer accepted", request: request3)

puts "DB seed done"
