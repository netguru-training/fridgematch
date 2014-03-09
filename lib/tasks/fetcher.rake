namespace :fetcher do
  desc "Fetch recipes"
  task :fetch_recipes, [:value] => :environment do |t, args|
    puts args
    range = if args.value.nil? 
      100 
    else
      args.value.to_i
    end
    puts range
    fetcher = RecipesFetcher.new
    (1..args.value.to_i).each do |i|
      fetcher.run(i)
    end
  end

  desc "Fetch nutritionics"
  task :fetch_nutritionics => :environment do
    nutritionix_fetcher = NutritronixFetcher.new
    ingredients = Ingredient.select { |ingredient| ingredient.name != nil }
    ingredients.each { |ingredient| nutritionix_fetcher.fetch(ingredient)}
  end
end