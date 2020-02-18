# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Product.delete_all
20.times do
  product = Product.create!(
      name: Faker::Commerce.unique.product_name,
      amount: rand(1..100),
      price: rand(1.0..500), # TODO .round(2) || "%.2f" % product.price
      published: true
      )
  puts "Created new product: #{product.name}"
end