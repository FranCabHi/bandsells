# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
code = "password"
50.times do 
    User.create(
        email: "band_"+"#{rand(1..50)}"+"@example.com"
        name: Faker::Music.unique.band
        country: Faker::Address.country
        password: code
    )
end

50.times do 
    User.create(
        email: "user_"+"#{rand(1..50)}"+"@example.com"
        name: Faker::Name.unique.name
        country: Faker::Address.country
        password: code
    )
end