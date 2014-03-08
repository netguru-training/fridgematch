class RecipesFetcher
  def initialize wrapper = RecipePuppy::Recipe
    @wrapper = wrapper
  end

  def run page = 1
    @wrapper.search_for("").page(page).get["results"].each do |recipe|
      recipe = Recipe.new(
        title: recipe['title'],
        url: recipe['href'],
        ingredients: ingredients(recipe['ingredients']),
        thumbnail: recipe['thumbnail']
      )

      if recipe.save
        puts "Added new recipe: #{recipe.title}"
      end
    end
  end

  private

  def ingredients api_list
    api_list.split(", ").map do |ing|
      Ingredient.find_or_create_by(name: ing)
    end
  end
end
