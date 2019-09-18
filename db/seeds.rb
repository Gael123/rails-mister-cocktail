require 'json'
require 'open-uri'
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
images = [
  'https://images.askmen.com/1080x540/2018/07/13-041818-how_to_drink_scotch.jpg',
  'https://i.kinja-img.com/gawker-media/image/upload/t_original/npayfbimfqderrucbsj6.jpg'
]
if Rails.env.development?
  puts 'Cleaning database...'
  Cocktail.destroy_all
  Dose.destroy_all
  Ingredient.destroy_all
end

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

# ingredients_list = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/list.php?"
ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: (ingredient['strIngredient1']))
end

puts 'creating cocktails'

cocktail_names = []
9.times { cocktail_names << Faker::Games::Witcher.monster }
cocktail_names.uniq.each do |name|
  @cocktail = Cocktail.new(name: name)
  @cocktail.remote_photo_url = images.sample
  @cocktail.save!
end

puts "Finished creating #{Cocktail.count} cocktails and #{Ingredient.count} ingredients"
