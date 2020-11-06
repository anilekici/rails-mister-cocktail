# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'rest-client'
# require 'json'
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "vodka")
# Ingredient.create(name: "soda")
# Ingredient.create(name: "gin")
# Ingredient.create(name: "tonic")
# Ingredient.create(name: "sprite")
# Ingredient.create(name: "juice")

Cocktail.destroy_all
Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
response = RestClient.get(url)
json = JSON.parse(response, symbolize_names: true)

json[:drinks].each do |drink|
  name = drink[:strIngredient1]

  puts "+ #{name}"

  Ingredient.create!(name: name)
end

puts "done"