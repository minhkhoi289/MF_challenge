# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create 5 users
(0..5).each do |i|
  User.create(
    email: "example#{i}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end

# create 50 seats
(0..49).each do |i|
  Seat.create(name: "Seat #{i}")
end
