class RecipesController < ApplicationController
  expose(:recipes) { match_recipes }

  def match
    match_hash = Hash.new { |h, key| h[key] = 0 }

    current_user.ingredients.each do |i|
      i.recipes.each do |r|
        match_hash[r] += 1
      end
    end

    @matching_recipes = match_hash.sort_by(&:last).map(&:first) # => [<Recipe> ,  <Recipe> , ...]
  end
end
