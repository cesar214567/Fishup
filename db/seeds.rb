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
#puts "creating users"
#
#user1 = User.create!(email:'owner1@gmail.com', password:'123456789', ssn:Faker::IDNumber.valid, first_name:Faker::Name.first_name , last_name: Faker::Name.last_name  , phone_number:'0997079516', owner: true, country:'Ecuador', city: 'Guayaquil', address:'victor emilio estrada', birth_date: Date.new, gender: "male")
#user1_avatar = URI.open("https://source.unsplash.com/120x120/?avatar
#")
#user1.avatar.attach({io:user1_avatar, filename:'avatar1', content_type:'image/png'})
#
#user2 = User.create!(email:'user1@gmail.com', password:'123456789', ssn:Faker::IDNumber.valid, first_name:Faker::Name.first_name , last_name: Faker::Name.last_name  , phone_number:'0997079516', owner: false, country:'Peru', city: 'Lima', address:'miraflores', birth_date: Date.new, gender: "male")
#user2_avatar = URI.open("https://source.unsplash.com/120x120/?avatar
#")
#user2.avatar.attach({io:user2_avatar, filename:'avatar2', content_type:'image/png'})
#
#user3 = User.create!(email:Faker::Internet.email, password:'123456789', ssn:Faker::IDNumber.valid, first_name:Faker::Name.first_name , last_name: Faker::Name.last_name  , phone_number:'0997079516', owner: false, country:'Peru', city: 'Lima', address:'barranco', birth_date: Date.new, gender: "male")
#user3_avatar = URI.open("https://source.unsplash.com/120x120/?avatar
#")
#user3.avatar.attach({io:user3_avatar, filename:'avatar3', content_type:'image/png'})
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
