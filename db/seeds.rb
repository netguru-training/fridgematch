# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# fetcher = RecipesFetcher.new
# nutritionix_fetcher = NutritronixFetcher.new

# (1..100).each do |i|
#    fetcher.run(i)
# end

# ingredients = Ingredient.select { |ingredient| ingredient.name != nil }
# ingredients.each { |ingredient| nutritionix_fetcher.fetch(ingredient)}

Diet.create(name: "Low Carb diet", description: 'Carmelized Onion fritata (1 serving), Strawberries (1 cup
  ), All American Tuna (1 serving), Simple Kale Salad (2 cup), Eye of round roast (8 ounces), Green Salad (2 cup), Cheddar cheese (2 oz), Roasted Halibut with Garlic Sauce', protein: 176.6, fat: 117.3, carbohydrates: 49.8, calories: 1955.7)
Diet.create(name: 'Bodybuilding diet', description: 'Breakfast pita pizza (1 pita), Nonfat greek yogurt (12 oz), All American Tuna (1 serving), Almonds (0.5 cup), Fish with Creamy Leeks (3 serving), Curry Chicken Salad (1 serving), Zesty Tomato Soup for one (1 serving)', protein: 386.9, fat: 106.3, carbohydrates: 113.3, calories: 2971.5)
Diet.create(name: 'Vegeterian diet', name: 'Berry and Spinach Smoothie (1 smoothie), Pan Roasted Asparagus (2 serving), Cool Summer Cucumber and Tomato Toss (1 serving), Simple Kale Salad (2 cup), Boy Chocks with Fried Shallots (2 serving), Almonds (0.5 cup), Michelada (2 serving)', carbohydrates: 156.5, fat: 117.7, protein: 70.5, calories: 1953.9)