# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )

10.times do
  Business.create(
    name: Faker::Company.name,
    full_street_address: Faker::Address.street_address.city.state_abbr.zip,
    website: Faker::Internet.url,
    phone: Faker::PhoneNumber.phone_number
  )
end

# 10.times do
#   Item.create(
#     title: Faker::Commerce.product_name,
#     inventory: Faker::Number.number(2),
#     price: Faker::Number.decimal(2)
#   )
#   Category.create(title: Faker::Commerce.department)
# end
#
# counter = 1
# Item.all.each do |item|
#   item.category_id = counter
#   item.save
#   counter += 1
# end
#
# 5.times do
#   User.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: "password",
#     password_confirmation: "password"
#   )
# end
