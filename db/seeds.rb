require "open-uri"

puts "Cleaning DB ..."

Message.destroy_all
Review.destroy_all
ExpertField.destroy_all
Offer.destroy_all
Request.destroy_all
Expert.destroy_all
User.destroy_all
Field.destroy_all

puts "DB cleaned"

puts "... creating 15 expertises ..."

home = Field.create!(expertise: "Home maintenance")
garden = Field.create!(expertise: "Gardening")
cook = Field.create!(expertise: "Cooking")
diy = Field.create!(expertise: "DIY")
tech = Field.create!(expertise: "Technology")
finance = Field.create!(expertise: "Finance")
health = Field.create!(expertise: "Health & sport")
art = Field.create!(expertise: "Art & design")
music = Field.create!(expertise: "Music")
language = Field.create!(expertise: "Language & writing")
sewing = Field.create!(expertise: "Sewing")
photo = Field.create!(expertise: "Photo & video")
carpentry = Field.create!(expertise: "Carpentry")
auto = Field.create!(expertise: "Automotive")
sustainability = Field.create!(expertise: "Eco-living")

puts "... creating user 0 ..."

user0 = User.new(email: "caro@mail.com", password: "ca1554", first_name: "Caroline", last_name: "Deuse", address: "Rue de Rome 9, 1060 Saint-Gilles", phone_number: "0468799972")
avatar = URI.open("https://avatars.githubusercontent.com/u/156318922?v=4")
user0.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user0.save!

puts "... creating experts 1-3 ..."

user1 = User.new(email: "thomas@yopmail.com", password: "123456", first_name: "Thomas", last_name: "Casper", address: "Rue du Milieu 11, 1370 Jodoigne", phone_number: "0468798973")
avatar = URI.open("https://media.istockphoto.com/id/690299268/photo/work-that-dirt-save-the-earth.jpg?s=612x612&w=0&k=20&c=yPX2VPWOF-c0nopsbdOQHFHHo14J0zU0rmkp-G_RTd4=")
user1.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user1.save!

expert_description = "I'm Thomas, and I specialize in home maintenance and gardening. With years of hands-on experience, I'm here to help you become proficient in these areas. From fixing that leaky faucet to creating your dream garden, I'll guide you every step of the way. Let's work together to enhance your home and outdoor spaces!"
expert1 = Expert.create!(description: expert_description, price_per_hour: 24, user: user1)
ExpertField.create!(expert: expert1, field: home)
ExpertField.create!(expert: expert1, field: garden)



user2 = User.new(email: "alice@yopmail.com", password: "123456", first_name: "Alice", last_name: "Smith", address: "Ottergemsesteenweg Zuid 799, Gent 9000", phone_number: "0468797974")
avatar = URI.open("https://lombardo-homes-images.s3.amazonaws.com/wp-content/uploads/2023/02/21144808/women-home-diy.jpg")
user2.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user2.save!

expert_description = "I'm Alice, your go-to expert for DIY. With my passion for creativity and knack for craftsmanship, I'll help you unleash your inner artist. From simple home decor to personalized gifts, I'll empower you with the skills and inspiration to bring your ideas to life. Let's get crafting!"
expert2 = Expert.create!(description: expert_description, price_per_hour: 30, user: user2)
ExpertField.create!(expert: expert2, field: diy)



user3 = User.new(email: "bob@yopmail.com", password: "123456", first_name: "Bob", last_name: "Johnson", address: "Nijverheidsstraat, 98A Wommelgem 2160", phone_number: "0468796975")
avatar = URI.open("https://t3.ftcdn.net/jpg/05/40/69/30/360_F_540693010_gAzpekRy6lOjOQJYptcqZSpmDOToGTSk.jpg")
user3.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user3.save!

expert_description = "I'm a versatile coach in both Music and Performing Arts as well as Language and Writing. With a passion for artistic expression and effective communication, I'm here to help you explore the realms of creativity and language. Whether you're refining your musical skills on an instrument or honing your writing craft, I offer personalized guidance tailored to your goals and interests. Let's embark on a journey of self-expression and growth through the power of music, performance, language, and writing!"
expert3 = Expert.create!(description: expert_description, price_per_hour: 18, user: user3)
ExpertField.create!(expert: expert3, field: music)
ExpertField.create!(expert: expert3, field: language)


puts "... creating users and experts 4-6 ..."


user4 = User.new(email: "carol@yopmail.com", password: "123456", first_name: "Carol", last_name: "Williams", address: "Rue des Fabriques, 8 - boîte 1, Fleurus 6220", phone_number: "0468795976")
avatar = URI.open("https://www.india.com/wp-content/uploads/2018/03/Yoga-for-women.jpg")
user4.photo.attach(io: avatar, filename: "profilepic.jpg", content_type: "image/jpg")
user4.save!

expert_description = "I'm Carol, your multifaceted guide! With a deep commitment to holistic well-being and sustainable living practices, I'm here to empower you to lead a healthier, more eco-conscious lifestyle. Whether you're learning to reduce your carbon footprint, mastering the art of sewing and crafting with textiles, or striving to improve your fitness and well-being, I offer comprehensive support and expertise. Let's work together to create a healthier, more sustainable world while nurturing your creativity and vitality!"
expert4 = Expert.create!(description: expert_description, price_per_hour: 21, user: user4)
ExpertField.create!(expert: expert4, field: sustainability)
ExpertField.create!(expert: expert4, field: sewing)
ExpertField.create!(expert: expert4, field: health)



user5 = User.new(email: "david@yopmail.com", password: "123456", first_name: "David", last_name: "Brown", address: "De Vunt 13/23, Holsbeek 3220", phone_number: "0468794977")
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


user7 = User.new(email: "pauline@yopmail.com", password: "pauline_pass", first_name: "Pauline", last_name: "Thompson", address: "Avenue de Vilvorde, 450, Bruxelles 1130", phone_number: "0468793979")
avatar7 = URI.open("https://nutriadvanced.gumlet.io/media/wysiwyg/nutri-lifestyle-79_Katherine_Header.jpg")
user7.photo.attach(io: avatar7, filename: "pauline_profile.jpg", content_type: "image/jpg")
user7.save!

expert_description7 = "Greetings! I'm Pauline, a nutrition expert passionate about creating personalized meal plans to help you achieve your health goals. Let's embark on a journey to a healthier lifestyle together!"
expert7 = Expert.create!(description: expert_description7, price_per_hour: 35, user: user7)
ExpertField.create!(expert: expert7, field: health)



user8 = User.new(email: "jackson@yopmail.com", password: "jackson_pass", first_name: "Jackson", last_name: "Johnson", address: "Rue de Birmingham, 110, Bruxelles 1070", phone_number: "0468792980")
avatar8 = URI.open("https://petapixel.com/assets/uploads/2023/09/photographer.jpg")
user8.photo.attach(io: avatar8, filename: "jackson_profile.jpg", content_type: "image/jpg")
user8.save!

expert_description8 = "Hello, I'm Jackson, a photography enthusiast. Whether it's capturing special moments or providing tips on enhancing your photography skills, I'm here to share my passion with you!"
expert8 = Expert.create!(description: expert_description8, price_per_hour: 28, user: user8)
ExpertField.create!(expert: expert8, field: photo)
ExpertField.create!(expert: expert8, field: art)



user9 = User.new(email: "olivia@yopmail.com", password: "olivia_pass", first_name: "Olivia", last_name: "Davis", address: "Kielstraat, 3, Zeebrugge 8380", phone_number: "0468791981")
avatar9 = URI.open("https://news.gsu.edu/files/2019/05/PantherProfileNatsai_Ndebele_01.jpg")
user9.photo.attach(io: avatar9, filename: "olivia_profile.jpg", content_type: "image/jpg")
user9.save!

expert_description9 = "Hi, I'm Olivia, a tech enthusiast. From troubleshooting to setting up devices, I'm here to make technology user-friendly for you. Let's navigate the digital world together!"
expert9 = Expert.create!(description: expert_description9, price_per_hour: 30, user: user9)
ExpertField.create!(expert: expert9, field: tech)
ExpertField.create!(expert: expert9, field: diy)


puts "... creating users and experts 10-12 ..."


user10 = User.new(email: "grace@yopmail.com", password: "grace_pass", first_name: "Grace", last_name: "Taylor", address: "Boulevard Poincaré 78-79, Saint-Gilles 1060", phone_number: "0468790982")
avatar10 = URI.open("https://d1zzxdyvtq79bu.cloudfront.net/context/frontend/landing/header_hero_masonry/chef/chef-93.jpg")
user10.photo.attach(io: avatar10, filename: "grace_profile.jpg", content_type: "image/jpg")
user10.save!

expert_description10 = "Hey there! I'm Grace, a professional chef passionate about creating culinary masterpieces. Let's embark on a flavorful journey and elevate your cooking skills together!"
expert10 = Expert.create!(description: expert_description10, price_per_hour: 50, user: user10)
ExpertField.create!(expert: expert10, field: cook)


user11 = User.new(email: "marcus@yopmail.com", password: "marcus_pass", first_name: "Marcus", last_name: "Baker", address: "Rue de la Station 49, Awans 4340", phone_number: "0468895983")
avatar11 = URI.open("https://as1.ftcdn.net/v2/jpg/06/05/11/12/1000_F_605111295_QyQY4Tk7bv8789bFA0TgGKeTM4zzowdo.jpg")
user11.photo.attach(io: avatar11, filename: "marcus_profile.jpg", content_type: "image/jpg")
user11.save!

expert_description11 = "Hello, I'm Marcus, an experienced and financial software developer. Whether it's coding challenges and project guidance, I'm here to help you navigate the world of programming. Let's code together!"
expert11 = Expert.create!(description: expert_description11, price_per_hour: 45, user: user11)
ExpertField.create!(expert: expert11, field: tech)
ExpertField.create!(expert: expert11, field: finance)



user12 = User.new(email: "isabella@yopmail.com", password: "isabella_pass", first_name: "Isabella", last_name: "Woods", address: "Werkhuizenkaai 100, Laken 1000", phone_number: "0467790984")
avatar12 = URI.open("https://www.seamwork.com/media/articles/1711/3c2a8046.jpg")
user12.photo.attach(io: avatar12, filename: "isabella_profile.jpg", content_type: "image/jpg")
user12.save!

expert_description12 = "Hi, I'm Isabella, a sewing enthusiast. From stitching basics to advanced techniques, I'm here to guide you through the world of sewing and textile crafts. Let's create something beautiful together!"
expert12 = Expert.create!(description: expert_description12, price_per_hour: 30, user: user12)
ExpertField.create!(expert: expert12, field: sewing)
ExpertField.create!(expert: expert12, field: diy)


puts "... creating users and experts 13-15 ..."


user13 = User.new(email: "michael@yopmail.com", password: "michael_pass", first_name: "Michael", last_name: "Smith", address: "Steenbakkersdam 43-44, Beerse 2340", phone_number: "0468294985")
avatar13 = URI.open("https://previews.123rf.com/images/dolgachov/dolgachov1611/dolgachov161102560/65205804-concept-de-service-de-r%C3%A9paration-d-entretien-et-de-personnes-m%C3%A9canicien-automobile.jpg")
user13.photo.attach(io: avatar13, filename: "michael_profile.jpg", content_type: "image/jpg")
user13.save!

expert_description13 = "Hello, I'm Michael, an automotive enthusiast. Whether it's routine maintenance or troubleshooting issues, I'm here to help you keep your vehicle running smoothly. Let's hit the road together!"
expert13 = Expert.create!(description: expert_description13, price_per_hour: 40, user: user13)
ExpertField.create!(expert: expert13, field: auto)



user14 = User.new(email: "julia@yopmail.com", password: "julia_pass", first_name: "Julia", last_name: "Miller", address: "Kleine Pathoekweg 51-53, Brugge 8000", phone_number: "0469095986")
avatar14 = URI.open("https://eco-business.imgix.net/uploads/ebmedia/fileuploads/9038731798_3f3e8c82f8_k.jpg?fit=crop&h=960&ixlib=django-1.2.0&w=1440")
user14.photo.attach(io: avatar14, filename: "julia_profile.jpg", content_type: "image/jpg")
user14.save!

expert_description14 = "Hi, I'm Julia, a sustainability advocate. From eco-friendly living tips to implementing sustainable practices, I'm here to guide you on the path to a greener lifestyle. Let's make a positive impact together!"
expert14 = Expert.create!(description: expert_description14, price_per_hour: 35, user: user14)
ExpertField.create!(expert: expert14, field: sustainability)



user15 = User.new(email: "daniel@yopmail.com", password: "daniel_pass", first_name: "Daniel", last_name: "Williams", address: "Waterkeringsstraat 10, Aalst 9320", phone_number: "0468096987")
avatar15 = URI.open("https://i.pinimg.com/736x/dd/d5/3d/ddd53d45a55decf598d7b7149eea1389.jpg")
user15.photo.attach(io: avatar15, filename: "daniel_profile.jpg", content_type: "image/jpg")
user15.save!

expert_description15 = "Greetings! I'm Daniel, a music enthusiast. Whether it's playing instruments or exploring the world of music theory, I'm here to share my passion and help you discover your musical journey. Let's make beautiful melodies together!"
expert15 = Expert.create!(description: expert_description15, price_per_hour: 30, user: user15)
ExpertField.create!(expert: expert15, field: music)


puts "... creating users and experts 16-20 ..."



user16 = User.new(email: "oliver@yopmail.com", password: "oliver_pass", first_name: "Oliver", last_name: "Johnson", address: "157 A Chaussée de Saint Ghislain, Chièvres 7950", phone_number: "0468479988")
avatar16 = URI.open("https://lingopie.com/blog/content/images/2022/05/HOWTOB-1.PNG")
user16.photo.attach(io: avatar16, filename: "oliver_profile.jpg", content_type: "image/jpg")
user16.save!

expert_description16 = "Hi, I'm Oliver, a language tutor. Whether you're brushing up on your vocabulary or aiming for fluency, I'm here to make your language learning journey enjoyable and effective. Let's explore new languages together!"
expert16 = Expert.create!(description: expert_description16, price_per_hour: 25, user: user16)
ExpertField.create!(expert: expert16, field: language)



user17 = User.new(email: "amelia@yopmail.com", password: "amelia_pass", first_name: "Amelia", last_name: "Taylor", address: "Rue des Tonneliers 1, Estaimpuis 7730", phone_number: "0468350989")
avatar17 = URI.open("https://www.nsu.edu/NSU/media/Photos/2020/Fine%20Arts/Fine-Arts-2466x1400-00002.jpg")
user17.photo.attach(io: avatar17, filename: "amelia_profile.jpg", content_type: "image/jpg")
user17.save!

expert_description17 = "Greetings! I'm Amelia, a graphic designer with a passion for creating visual identities. Whether it's logos, branding, or digital art, I'm here to turn your vision into stunning visuals. Let's design together!"
expert17 = Expert.create!(description: expert_description17, price_per_hour: 35, user: user17)
ExpertField.create!(expert: expert17, field: art)
ExpertField.create!(expert: expert17, field: diy)



user18 = User.new(email: "mila@yopmail.com", password: "mila_pass", first_name: "Mila", last_name: "Harris", address: "Geleenlaan 34, Genk 3600", phone_number: "0468939790")
avatar18 = URI.open("https://img.freepik.com/free-photo/young-happy-woman-making-bruschetta-while-preparing-food-kitchen_637285-3108.jpg")
user18.photo.attach(io: avatar18, filename: "mila_profile.jpg", content_type: "image/jpg")
user18.save!

expert_description18 = "Hello, I'm Mila, a cooking enthusiast. From mastering culinary techniques to exploring diverse cuisines, I'm here to help you become a confident home chef. Let's cook up some delicious experiences together!"
expert18 = Expert.create!(description: expert_description18, price_per_hour: 30, user: user18)
ExpertField.create!(expert: expert18, field: cook)



user19 = User.new(email: "george@yopmail.com", password: "george_pass", first_name: "George", last_name: "Harris", address: "Avenue du Hockey 101, 1150 Bruxelles", phone_number: "0468490891")
avatar19 = URI.open("https://media.istockphoto.com/id/934807334/photo/hardworking-carpenter-polishing-wood-using-abrasive-paper.jpg?s=612x612&w=0&k=20&c=k0-jRN-Wi4f1exo3an-eDWi_IAOcR5yXJxtqDnZx2kI=")
user19.photo.attach(io: avatar19, filename: "george_profile.jpg", content_type: "image/jpg")
user19.save!

expert_description19 = "Greetings! I'm George, a skilled carpenter with a passion for crafting wood into functional and beautiful creations. Whether it's custom furniture, intricate woodwork, or home renovations, I'm here to bring your ideas to life. Let's build something extraordinary together!"
expert19 = Expert.create!(description: expert_description19, price_per_hour: 28, user: user19)
ExpertField.create!(expert: expert19, field: carpentry)

user20 = User.new(email: "geof@mail.com", password: "ge1554", first_name: "Geoffroy", last_name: "De Cooman", address: "Drève des Volubilis, 1170 Bruxelles", phone_number: "0468798973")
avatar20 = URI.open("https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/home-improvement/wp-content/uploads/2023/04/featured-image-gardening.jpg")
user20.photo.attach(io: avatar20, filename: "geo_profilepic.jpg", content_type: "image/jpg")
user20.save!

expert_description20 = "👋 Hey there I'm Geoffroy, a gardening enthusiast keen on sharing my green thumb secrets.
Whether it’s starting your first plant or enhancing your garden, I offer straightforward tips and creative insights.
Let’s make gardening fun and accessible for all. Join me in growing our green spaces together! 🌱 !"
expert20 = Expert.create!(description: expert_description20, price_per_hour: 24, user: user20)
ExpertField.create!(expert: expert20, field: garden)






puts "... creating 9 requests ..."

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

request3 = Request.new(title: "How to do a tiramisu?", description: "Looking for a skilled individual to prepare a delicious Tiramisu. Craving the perfect blend of coffee, mascarpone, and ladyfingers. If you have expertise in crafting this Italian dessert, please reach out. Compensation provided. Ready to savor the sweet delight!", estimated_time: 1, address: "", status: "Offer accepted", user: user15, expert: expert18)

request3.save!

request4 = Request.new(title: "Garden maintenance", description: "Looking for a skilled individual to work in my garden. Tasks include planting, weeding, and general maintenance. Experience in gardening preferred. Flexible hours. Join me in creating a vibrant and flourishing outdoor space!", estimated_time: 3, address: "", status: "Offer accepted", user: user0, expert: expert1)

request4.save!

request5 = Request.new(title: "building my outdoor", description: "I need someone to transform my outdoor space into a beautiful oasis. Here is a picture now, and what I would like my garden to look like. I want to learn and that our experienced team brings me creativity and expertise to enhance my garden's aesthetics. From planting to maintenance, my landscaping needs covered!", estimated_time: 6, address: "", status: "Pending", user: user0, expert: expert2)

request5.save!

request6 = Request.new(title: "Change my stairs", description: "Hello ! I want to build a new stairs at my place. It needs to be in wood and I need an expert with this compentence. I think there is work for like 1 week. The stairs will have 16 steps and it will be curved.", estimated_time: 60, address: "", status: "Pending", user: user0, expert: expert19)
picture = URI.open("https://images.unsplash.com/photo-1579625224541-baaba72b3f06?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c3RhaXJzfHx8fHx8MTcwOTg5MTY3Mg&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080")
request6.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
picture = URI.open("https://images.unsplash.com/photo-1521311394770-4cbf8c2508bb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8c3RhaXJzLXdvb2R8fHx8fHwxNzA5ODkxNzY1&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080")
request6.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")

request6.save!

request7 = Request.new(title: "Help for cutting wood", description: "Hello, I need someone to teach me how to cut wood. I don't have the experience and the material to do it. I have 20 steles of wood to cut in my garden, I think it will take all afternoon.", estimated_time: 5, address: "", status: "Offer made", user: user0, expert: expert1)
picture = URI.open("https://images.unsplash.com/photo-1564250242370-ba316ca2188f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8d29vZHx8fHx8fDE3MDk4OTE4MjA&ixlib=rb-4.0.3&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1080")
request7.pictures.attach(io: picture, filename: "requestpic.jpg", content_type: "image/jpg")
request7.save!

request8 = Request.new(title: "Small garden", description: "Hey Geoffroy,

  I've recently moved into a place with a small garden that's been neglected for a while. I'd love to turn it into a vibrant flower garden but honestly, I don't know where to start. Do you think you could help me figure out which plants would thrive and how to care for them? I'm aiming for something low maintenance but beautiful.

  Thanks so much,
  Isabella", estimated_time: 16, address: "", status: "Offer accepted", user: user12, expert: expert20)

request8.save!

request9 = Request.new(title: "Balcony space", description: "Hi Geoffroy,

  I hope you're doing well! I've always admired the community garden projects and your incredible knack for gardening. My balcony space is pretty bare, and I'd love to turn it into a mini herb and vegetable garden. However, I'm not sure which plants are suitable for a balcony setting or how to start. Could you provide some guidance or even help set it up?

  Best,
  Grace", estimated_time: 6, address: "", status: "Offer accepted", user: user10, expert: expert20)

request9.save!


puts "... and 7 offers ..."

offer1 = Offer.create!(content: "Hello Caroline, Thank you for considering my gardening services. I'm delighted to assist you in creating a vibrant outdoor space. I will propose you to work this week-end for 6 hours in the afternoon. There will be extra-costs for the hedge trimmer that I will bring to your place, but I offer you 1 our for first meeting. My price per hour is 24€. Have a nice day ! \nBest regards, \n\nThomas", occurs_on: Date.new(2024, 03, 15), time: 2, extra_costs: 10, reduction: 20, status: "Offer made", request: request1)

offer2 = Offer.create!(content: "Hello Caroline, Thank you for considering my services. I'm thrilled to assist in transforming your outdoor space into a stunning oasis. Let's collaborate this weekend for 6 hours in the afternoon. The initial hour is on the house. My rate is 30€ per hour. Excited for our first meeting to discuss your landscaping dreams! Best regards, Alice", occurs_on: Date.new(2024, 01, 15), time: 1, extra_costs: 0, reduction: 10, status: "Offer accepted", request: request2)

offer3 = Offer.create!(content: "Hello Daniel, Thank you for selecting me! I'm thrilled to assist you in creating the perfect Tiramisu. I propose dedicating this weekend to our venture, investing 1 delightful hour in the afternoon. My rate is 18€ per hour. Looking forward to our sweet collaboration! Best regards, Mila", occurs_on: Date.new(2024, 02, 17), time: 1, extra_costs: 5, reduction: 0, status: "Offer accepted", request: request3)

offer4 = Offer.create!(content: "Hello there! I was thrilled to read your request for a skilled gardener to assist in creating a vibrant and flourishing outdoor space. With over 15 of experience in gardening and landscape design, I'm excited about the opportunity to bring your garden to life. I specialize in planting, with a deep understanding of plant varieties suitable for different climates and soil types. Weeding and general maintenance are tasks I approach with care and precision, ensuring that your garden not only looks beautiful but also thrives sustainably. Flexible hours work perfectly for me, as I believe in adapting to the natural rhythms of the garden and the preferences of my clients. I'm eager to discuss your vision for the space, including any specific plants or themes you have in mind. Let's transform your garden into a haven of beauty and tranquility. Please feel free to reach out so we can schedule a time to discuss your project in detail. Best regards, Thomas", occurs_on: Date.new(2024, 02, 15), time: 1, extra_costs: 5, reduction: 0, status: "Offer accepted", request: request4)

offer5 = Offer.create!(content: "Hello! I'd be delighted to teach you woodcutting, bringing both expertise and tools. With experience in various techniques, we'll efficiently tackle those 20 steles in your garden. Let's set a date for a productive afternoon. Tom", occurs_on: Date.new(2024, 3, 17), time: 1, extra_costs: 5, reduction: 0, status: "Offer made", request: request7)

offer6 = Offer.create!(content: "Hi Isabella,

  Absolutely, I'd be thrilled to help you transform your garden into a blooming haven! We can start with some hardy, low-maintenance perennials that are perfect for beginners and will bring color to your space year after year. I'll walk you through the basics of soil preparation, planting, and simple care routines. How about we set up a time this weekend to take a look at your space and discuss your vision?

  Looking forward to it,
  Geoffroy", occurs_on: Date.new(2024, 3, 11), time: 16, extra_costs: 50, reduction: 0, status: "Offer accepted", request: request8)

  offer7 = Offer.create!(content: "Hello Grace,

    I'm delighted to hear from you and even more so to assist with your balcony garden project! Growing herbs and vegetables in a balcony setting can be incredibly rewarding and definitely feasible. I'll help you select the best plants that thrive in containers and share tips on maximizing your space for a bountiful harvest. Let's plan a visit to assess the sunlight and space on your balcony, and we'll craft a personalized gardening plan together.

    Warm regards,
    Geoffroy", occurs_on: Date.new(2024, 3, 5), time: 6, extra_costs: 50, reduction: 0, status: "Offer accepted", request: request9)


puts "... and 17 reviews ..."

review1 = Review.create!(rating: 5, comment: "Geoffroy is a garden wizard; he turned my backyard jungle into a serene paradise.", user: user10, expert: expert20)
review1.created_at = Date.new(2024, 3, 12)
review1.save!

review2 = Review.create!(rating: 4, comment: "Fixed my leaky taps. Efficient, though arrived later than expected", user: user5, expert: expert1)
review2.created_at = Date.new(2024, 3, 11)
review2.save!

review3 = Review.create!(rating: 5, comment: "Incredible knowledge on plant care. My garden has never looked this alive! 🌷", user: user12, expert: expert20)
review3.created_at = Date.new(2024, 3, 8)
review3.save!

review4 = Review.create!(rating: 3, comment: "Advice on lawn care was helpful, but I still have some patchy areas. Might need a follow-up session.", user: user0, expert: expert1)
review4.created_at = Date.new(2023, 9, 5)
review4.save!

review5 = Review.create!(rating: 5, comment: "Thomas tackled all my home maintenance issues with ease. From squeaky doors to a stubborn window, everything works perfectly now.", user: user17, expert: expert1)
review5.created_at = Date.new(2024, 3, 1)
review5.save!

review6 = Review.create!(rating: 4, comment: "His work on the garden was almost perfect. Just a note, the mint might take over if not contained!", user: user8, expert: expert1)
review6.created_at = Date.new(2024, 2, 26)
review6.save!

review7 = Review.create!(rating: 5, comment: "Thomas's dedication to reviving my plants was exceptional. He's not just a gardener; he's a plant doctor!", user: user9, expert: expert1)
review7.created_at = Date.new(2024, 2, 20)
review7.save!

review8 = Review.create!(rating: 3, comment: "Thomas's dedication to reviving my plants was exceptional. He's not just a gardener; he's a plant doctor!", user: user18, expert: expert1)
review8.created_at = Date.new(2024, 2, 15)
review8.save!

review9 = Review.create!(rating: 4, comment: "Working with Thomas on our garden and home maintenance projects was a genuinely enlightening experience. His breadth of knowledge in both areas was impressive, offering insightful tips on everything from seasonal planting to energy-efficient home repairs. While his gardening work was exceptional, bringing much-needed life and color to our outdoor space, we encountered a few hiccups with scheduling, leading to slight delays. Nonetheless, Thomas's friendly demeanor and willingness to go above and beyond in explaining each process made up for any inconvenience. I would recommend Thomas to those looking to enhance their home and garden, albeit with a note to book him in advance.", user: user15, expert: expert1)
review9.created_at = Date.new(2024, 2, 12)
review9.save!

review10 = Review.create!(rating: 5, comment: "Beyond impressed with Thomas's ability to fix a wide range of home issues. His hands-on approach and tips have saved me countless dollars.", user: user13, expert: expert1)
review10.created_at = Date.new(2024, 2, 10)
review10.save!

review11 = Review.create!(rating: 5, comment: "Alice’s DIY workshop was inspiring. I never thought I'd be able to craft such beautiful home decor on my own!", user: user5, expert: expert2)
review11.created_at = Date.new(2024, 3, 10)
review11.save!

review12 = Review.create!(rating: 3, comment: "The macrame session was harder than expected, and my piece didn’t turn out as hoped. Still, Alice was encouraging throughout 😊.", user: user6, expert: expert2)
review12.created_at = Date.new(2024, 3, 2)
review12.save!

review13 = Review.create!(rating: 4, comment: "Alice's creativity is contagious! I loved the personal touch she brings to all her projects. Looking forward to more DIY adventures.", user: user11, expert: expert2)
review13.created_at = Date.new(2024, 2, 21)
review13.save!

review14 = Review.create!(rating: 5, comment: "Bob has an incredible talent for making complex musical theories accessible. His patience and encouragement have transformed my approach to piano playing, making practice something I genuinely look forward to.", user: user9, expert: expert3)
review14.created_at = Date.new(2024, 3, 11)
review14.save!

review15 = Review.create!(rating: 3, comment: "Attended Bob's writing workshop hoping to unlock my potential as a novelist. While I gained some useful tips, I found the sessions to be somewhat generic, lacking the personalized feedback I was seeking.", user: user6, expert: expert3)
review15.created_at = Date.new(2024, 3, 4)
review15.save!

review16 = Review.create!(rating: 4, comment: "Bob's enthusiasm for languages is contagious. His interactive lessons have greatly improved my Spanish fluency 🇪🇸, though I wish there were more opportunities for real-world conversation practice.", user: user18, expert: expert3)
review16.created_at = Date.new(2024, 2, 25)
review16.save!

review17 = Review.create!(rating: 5, comment: "Bob's unique ability to blend music theory with creative writing exercises has opened up new avenues of artistic expression for me. His guidance has been invaluable in my journey towards becoming a more versatile artist.", user: user19, expert: expert3)
review17.created_at = Date.new(2024, 2, 21)
review17.save!

puts "DB seed done"


request1.update(updated_at: Date.new(2024, 2, 10))
request2.update(updated_at: Date.new(2024, 2, 15))
request3.update(updated_at: Date.new(2024, 2, 25))
request4.update(updated_at: Date.new(2024, 3, 3))
request5.update(updated_at: Date.new(2024, 3, 9))
request6.update(updated_at: Date.new(2024, 3, 11))
request7.update(updated_at: Date.new(2024, 3, 12))
