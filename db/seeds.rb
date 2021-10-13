require 'faker'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#puts "deleting previous db"

#puts "creating users"
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

catch1 = Catch.create!(name:"tramboyo",description:"Suele ser un pez de rocas, cuerpo recubierto de escamas cicloideas, pocas especies sin escamas; la aleta dorsal tienen más espinas que radios blandos, algunas especies incluso sólo tienen espinas en esta aleta",habitat:"Estan distribuidos por el atlantico y pacifico", scientific_name:"Auchenionchus microcirrhis",minimum_size: 15,maximum_size:30)
catch1_image = URI.open("http://tumi.lamolina.edu.pe/infopes/wp-content/uploads/2018/05/Tramboyo-.jpg")
catch1.image.attach({io:catch1_image, filename:'catch1', content_type:'image/png'})


catch2 = Catch.create!(name:"pejerrey",description:"El pejerrey es un pez de cuerpo largado, comprimido lateralmente, con pedúnculo caudal largo y bajo. De perfil dorsal más o menos recto, con hocico puntiagudo. Su dorso de color verde oliváceo presenta una banda longitudinal plateada sobre los flancos, con una línea azul reflectante en su reborde superior. La aleta caudal es amarilla, marginado con negro, aletas dorsales y pectorales (región dorsal) suavemente punteadas, aletas pélvicas y anal traslúcidas e incoloras. Presenta escamas cicloides pequeñas que cubren todo el cuerpo, sin invadir las aletas, a excepción de la base de la caudal. Línea lateral discontinua, con escamas acanaladas distribuidas en forma irregular",habitat:"Habita en el subsistema pelágico nerítico sobre fondos arenosos, con vegetación y desembocadura de ríos. Los individuos juveniles se distribuyen en zonas cercanas al mar abierto", scientific_name:"Odontesthes regia",minimum_size: 14,maximum_size:25)
catch2_image = URI.open("http://tumi.lamolina.edu.pe/infopes/wp-content/uploads/2018/05/Tramboyo-.jpg")
catch2.image.attach({io:catch2_image, filename:'catch2', content_type:'image/png'})

catch3 = Catch.create!(name:"chita",description:"Pez de boca pequeña con labios gruesos y dientes en la mandíbula, normalmente con amplios poros en la barbilla y siete hendiduras branquiales. Los ejemplares adultos de chita presentan el cuerpo alto y robusto, perfil de cabeza convexa y boca pequeña baja y terminal. Sus escamas son grandes y presentan manchas oscuras en sus márgenes anteriores, dando la apariencia de bandas oblicuas.",habitat:"Especie costera asociada a zonas rocosas y arenosas", scientific_name:"Anisotremus scapularis",minimum_size: 24,maximum_size:55)
catch3_image = URI.open("http://tumi.lamolina.edu.pe/infopes/wp-content/uploads/2018/05/Tramboyo-.jpg")
catch3.image.attach({io:catch3_image, filename:'catch3', content_type:'image/png'})

bait_catch = BaitCatch.create!(bait:Bait.first,catch:Catch.first)
bait_catc2 = BaitCatch.create!(bait:Bait.first,catch:Catch.second)
bait_catc3 = BaitCatch.create!(bait:Bait.first,catch:Catch.third)

puts "all done!"
