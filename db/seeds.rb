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
#
#user4 = User.create!(email:Faker::Internet.email, password:'123456789', ssn:Faker::IDNumber.valid, first_name:Faker::Name.first_name , last_name: Faker::Name.last_name  , phone_number:'0997079516', owner: false, country:'Peru', city: 'Lima', address:'Jesus maria', birth_date: Date.new, gender: "female")
#user4_avatar = URI.open("https://source.unsplash.com/120x120/?avatar
#")
#user4.avatar.attach({io:user4_avatar, filename:'avatar4', content_type:'image/png'})
#
#user5 = User.create!(email:Faker::Internet.email, password:'123456789', ssn:Faker::IDNumber.valid, first_name:Faker::Name.first_name , last_name: Faker::Name.last_name  , phone_number:'0997079516', owner: false, country:'Peru', city: 'Lima', address:'chorrillos', birth_date: Date.new, gender: "female")
#user5_avatar = URI.open("https://source.unsplash.com/120x120/?avatar
#")
#
#user5.avatar.attach({io:user5_avatar, filename:'avatar5', content_type:'image/png'})
#
#
#puts "creating ships"
#ship_pic = open("https://images.unsplash.com/photo-1623881168429-dcc3b542f826?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8c2hpcHx8fHx8fDE2MzM0NjU0NTU&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600")
#ship_pic2 = open("https://images.unsplash.com/photo-1527685609591-44b0aef2400b?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8c2hpcHx8fHx8fDE2MzM0NjU0ODA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600")
#
#ship1 = Ship.create!(user: user1, max_people: 10, price: 850, ship_type: 'party', name: "la vaquita", description:"lindo velero para pasar buen fin de semana", longitude:Faker::Address.longitude, latitude: Faker::Address.latitude)
#ship1.images.attach({io:ship_pic, filename:'ship_pic', content_type:'image/png'},{io:ship_pic2, filename:'ship_pic2', content_type:'image/png'})
#sleep(5)
#
#ship2 = Ship.create!(user: user1, max_people: 8, price: 650, ship_type: 'party', name: "marsopa", description:"lindo velero para pasar buen fin de semana", longitude:Faker::Address.longitude, latitude: Faker::Address.latitude )
#ship2.images.attach({io:ship_pic, filename:'ship_pic', content_type:'image/png'},{io:ship_pic2, filename:'ship_pic2', content_type:'image/png'})
#sleep(5)
#
#ship3 = Ship.create!(user: user1, max_people: 6, price: 450, ship_type: 'party', name: "la pinta", description:"lindo velero para pasar buen fin de semana", longitude:Faker::Address.longitude, latitude: Faker::Address.latitude )
#ship3.images.attach({io:ship_pic, filename:'ship_pic', content_type:'image/png'},{io:ship_pic2, filename:'ship_pic2', content_type:'image/png'})
#sleep(5)
#
#ship4 = Ship.create!(user: user1, max_people: 20, price: 1500, ship_type: 'party', name: "la nina", description:"lindo velero para pasar buen fin de semana", longitude:Faker::Address.longitude, latitude: Faker::Address.latitude )
#ship4.images.attach({io:ship_pic, filename:'ship_pic', content_type:'image/png'},{io:ship_pic2, filename:'ship_pic2', content_type:'image/png'})
#sleep(5)
#
#Reservation.new(user: user2, ship: ship, price: 2500, negotiation_status: "reply", reservation_start: Time.new.next_day(1), reservation_end: Time.new, people_in_reservation: 10)
puts "all done!"
