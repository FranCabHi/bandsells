# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
# code = "password"
# 50.times do 
#     User.create(
#         email: "owner_"+"#{rand(1..50)}"+"@example.com",
#         name: Faker::Music.unique.band,
#         country: Faker::Address.country,
#         password: code
#     ).add_role :owner
# end

# 50.times do 
#     User.create(
#         email: "user_"+"#{rand(1..50)}"+"@example.com",
#         name: Faker::Name.unique.name,
#         country: Faker::Address.country,
#         password: code
#     ).add_role :normaluser
# end

# 1.times do 
#     User.create(
#         email: "admin@example.com", 
#         name: "admin", 
#         country: "Chile", 
#         password: code
#     ).add_role :admin
# end

users = User.with_role(:owner).pluck(:id)

50.times do  
    good = Product.create(
        title: Faker::Music.album,
        description: Faker::Lorem.sentence(word_count: 5),
        stock: 50,
        unit_price: rand(1199..2099)*10,
        user_id: users.sample
    )
    random = rand(1..9)
    good.image.attach(io: File.open("app/assets/images/00"+"#{random}"+".jpg"), filename: "00"+"#{random}"+".jpg", content_type: 'image/jpg')
end
