# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.delete_all
Business.delete_all
Product.delete_all
Tag.delete_all
Category.delete_all

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password",
    image: Faker::Placeholdit.image
  )
end

10.times do
  Business.create(
    name: Faker::Company.name,
    full_street_address: Faker::Address.street_address,
    website: Faker::Internet.url,
    phone: Faker::PhoneNumber.phone_number,
    image: Faker::Placeholdit.image
  )
end

10.times do
  Product.create(
    name: Faker::Commerce.product_name,
    image: Faker::Placeholdit.image
  )
end

30.times do
  Tag.create(
    name: Faker::Hipster.word
  )
end

10.times do
  Category.create(
    name: Faker::Commerce.unique.department(1)
  )
end

counter = 1
Product.all.each do |product|
  product.business_ids << counter
  product.save
  counter += 1
end

counter = 1
Business.all.each do |business|
  business.category_id = counter
  business.save
  counter += 1
end

counter = 1
Product.all.each do |product|
  product.tag_ids << counter
  product.save
  counter += 1
end

Product.all.each do |product|
  product.tag_ids << counter
  product.save
  counter += 1
end

Product.all.each do |product|
  product.tag_ids << counter
  product.save
  counter += 1
end
