# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# fetcher = RecipesFetcher.new
nutritionix_fetcher = NutritronixFetcher.new

# (1..100).each do |i|
#   fetcher.run(i)
# end

ingredient_names = Ingredient.pluck(:name).compact
ingredient_names.each { |name| nutritionix_fetcher.fetch(name)}