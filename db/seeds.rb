# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..2).each do |i| 
  RecipePuppy::Recipe.search_for("").page(i).get["results"].each do |recipe|
    ingredients = recipe['ingredients'].split(", ")
    ingredients = ingredients.map do |ing|
      Ingredient.find_or_create_by(name: ing)
    end


    Recipe.create(title: recipe['title'], url: recipe['href'], ingredients: ingredients, 
    thumbnail: recipe['thumbnail'])
  end
end