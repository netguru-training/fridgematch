class RecipesFetcher
  def run page = 1
    RecipePuppy::Recipe.search_for("").page(page).get["results"].each do |recipe|
      ingredients = recipe['ingredients'].split(", ")
      ingredients = ingredients.map do |ing|
        Ingredient.find_or_create_by(name: ing)
      end

      recipe = Recipe.new(title: recipe['title'], url: recipe['href'], ingredients: ingredients, thumbnail: recipe['thumbnail'])

      if recipe.save
        puts "Added new recipe: #{recipe.title}"
      end
    end
  end
end
