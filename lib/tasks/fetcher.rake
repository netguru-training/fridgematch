namespace :fetch do
  desc "Fetch recipes"
  task :recipes, [:value] => :environment do |t, args|
    range   = args.value || 100
    fetcher = RecipesFetcher.new
    (1..args.value.to_i).each do |i|
      fetcher.run(i)
    end
  end

  desc "Fetch nutritionics"
  task :nutritionics, [:value] => :environment do
    nutritionix_fetcher = NutritronixFetcher.new
    ingredients = Ingredient.select { |ingredient| ingredient.name != nil }
    ingredients.take((args.value || 1000).to_i).each do |ingredient|
      nutritionix_fetcher.fetch(ingredient)
    end
  end
end
