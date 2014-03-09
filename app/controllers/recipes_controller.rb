class RecipesController < ApplicationController
  expose_decorated(:recipes) { RecipeMatcher.new(current_user).find(10) }
  expose(:diet){ Diet.find(params[:diet_id]) }

  def index
    if params[:diet_id].present?
      self.recipes.reject! do |r|
        nv = r.nutritional_values
        diet.calories < nv[:calories] &&
          diet.fat < nv[:fat] &&
          diet.carbohydrates < nv[:carbohydrates] &&
          diet.protein < nv[:protein]
      end
    end
  end
end
