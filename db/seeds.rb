require 'faker'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting previous db"
puts "creating catches"

User.create!(email:'user1@gmail.com', first_name:'user', last_name:'number1', phone_number:'123456789', country:'ecuador', city:'guayaquil', password: '123456789', address: 'en mi casa', birth_date: Time.now)

catch1 = Catch.create!(name: "Acadian Redfish" , description:'Acadian redfish are orange to flame red, with paler underbellies.', habitat: "Off New England they are most common in the deep waters of the Gulf of Maine (to depths of 975 feet)", scientific_name:"Sebastes fasciatus", maximum_size: 20, minimum_size:18)
fishpic1 = URI.open('https://www.fishwatch.gov/sites/default/files/acadian_redfish.png')
catch1.image.attach({io:fishpic1, filename: 'redfish', content_type:'image/png'})


catch2 = Catch.create!(name: "Bigeye Tuna" , description:"Bigeye tuna are dark metallic blue on the back and upper sides and white on the lower sides and belly.", habitat: "Bigeye tuna are a highly migratory species, swimming long distances throughout the ocean.", scientific_name:"Thunnus obesus", maximum_size: 6, minimum_size:5.5)
fishpic2 = URI.open('https://www.fishwatch.gov/sites/default/files/atlantic_bigeye_tuna.png')
catch2.image.attach({io:fishpic2, filename:"bigeye tuna", content_type:'image/png'})

catch3 = Catch.create!(name: "Atlantic Chub Mackerel" , description:"They are silvery in color, with greenish-blue backs. The upper surfaces have dark zigzagging stripes, and the bellies are pale and marked with wavy lines.", habitat: "Western Atlantic Ocean range from Nova Scotia (where they are rare) through Argentina, including the Gulf of Mexico.  ", scientific_name:"Scomber colias", maximum_size: 22 , minimum_size: 18)
fishpic3 = URI.open('https://www.fishwatch.gov/sites/default/files/Atlantic-chub-mackerel-FNL_NB_W.png')
catch3.image.attach(io: fishpic3, filename:'Atlantic Chub Mackerel', content_type: 'image/png')

catch4 = Catch.create!(name: "Atlantic Common Thresher Shark" , description:"Their pectoral, pelvic, and dorsal fins are blackish, and there are sometimes white dots on the tips of the pectoral, pelvic, and tail fins.", habitat: "In the northwest Atlantic Ocean, they range from Newfoundland to Cuba.", scientific_name:"Alopias vulpinus", maximum_size:20 , minimum_size:18)
fishpic4 = URI.open('https://www.fishwatch.gov/sites/default/files/atlantic_common_thresher_shark_0.png')
catch4.image.attach({io:fishpic4, filename:'Atlantic Common Thresher Shark', content_type: 'image/png'})

catch5 = Catch.create!(name: "Atlantic Mahi Mahi" , description:"Brightly colored back is an electric greenish blue, lower body is gold or sparkling silver, and sides have a mixture of dark and light spots.", habitat: "Mahi mahi are found in the Atlantic, Gulf of Mexico, and Caribbean, and are caught from Massachusetts to Texas.", scientific_name:"Coryphaena hippurus", maximum_size:7 , minimum_size:6.5)
fishpic5 = URI.open('https://www.fishwatch.gov/sites/default/files/atlantic_mahimahi_dolphinfish_0.png')
catch5.image.attach({io: fishpic5, filename:'Atlantic Mahi Mahi',content_type:'image/png'})

#
user1 = User.create!(email:'camgcamg11@gmail.com', password:'123456789', first_name:Faker::Name.first_name , last_name: Faker::Name.last_name  , phone_number:'0997079516',  country:'Ecuador', city: 'Guayaquil', address:'victor emilio estrada', birth_date: Date.new)
user1_avatar = URI.open("https://source.unsplash.com/120x120/?avatar
")
user1.avatar.attach({io:user1_avatar, filename:'avatar1', content_type:'image/png'})

user2 = User.create!(email:'eduardo@gmail.com', password:'123456789', first_name:Faker::Name.first_name , last_name: Faker::Name.last_name  , phone_number:'0997079516', country:'Peru', city: 'Lima', address:'miraflores', birth_date: Date.new)
user2_avatar = URI.open("https://source.unsplash.com/120x120/?avatar
")
user2.avatar.attach({io:user2_avatar, filename:'avatar2', content_type:'image/png'})

user3 = User.create!(email:"felipe@gmail.com", password:'123456789', first_name:Faker::Name.first_name , last_name: Faker::Name.last_name  , phone_number:'0997079516', country:'Peru', city: 'Lima', address:'barranco', birth_date: Date.new)
user3_avatar = URI.open("https://source.unsplash.com/120x120/?avatar
")
user3.avatar.attach({io:user3_avatar, filename:'avatar3', content_type:'image/png'})

bait1 = Bait.create!(cost: "3 dollars per dozen", name: "marucha", description: "Maybe the best bait of all times")
bait1_image = URI.open("https://source.unsplash.com/120x120/?worm
")
bait1.image.attach({io:bait1_image, filename:'image1', content_type:'image/png'})

bait_catch = BaitCatch.create!(bait:Bait.first,catch:Catch.first)
bait_catc2 = BaitCatch.create!(bait:Bait.first,catch:Catch.second)
bait_catc3 = BaitCatch.create!(bait:Bait.first,catch:Catch.third)

spot1 = Spot.create!(name: "muelle de chorrillos",description: "lugar para obtener carnada y pescar pejerreyes.",latitude: -12.164645558675222, longitude:-77.0299903674119)
catch_spot1 = CatchSpot.create!(spot:spot1,catch:Catch.first,rarity:"Common")
spot_image = URI.open("https://res.cloudinary.com/ddlmgs04n/image/upload/v1634071063/Fish%20up/eberhard-grossgasteiger-DmIJbj6-3-c-unsplash_qn32kw.jpg")
spot1.images.attach({io:spot_image, filename:'image_spots', content_type:'image/png'})


spot2 = Spot.create!(name: "Lago Hermoso",description: "Is a small lake on Argentina, located on Neuquen. You can find diferent species of fish.",latitude: -40.348244645061605, longitude:-71.519812218733)
spot_image2 = URI.open("https://res.cloudinary.com/ddlmgs04n/image/upload/v1634071059/Fish%20up/joe-pohle-BKTXvgH3IRc-unsplash_hvz0vu.jpg")
spot2.images.attach({io:spot_image2, filename:'image_spots2', content_type:'image/png'})

spot3 = Spot.create!(name: "Lago Nahuel Huapi",description: "Is a huge lake on the south of Argentina, located on Bariloche, Rio Grande. You can find diferent species of fish. Great place to go fishing",latitude: -40.90623084689651, longitude:-71.514833479767)
spot_image3 = URI.open("https://res.cloudinary.com/ddlmgs04n/image/upload/v1634228260/Fish%20up/kyle-johnson-TEZZzuQTt8g-unsplash_qjbci2.jpg")
spot3.images.attach({io:spot_image3, filename:'image_spots2', content_type:'image/png'})

puts "all done!"
