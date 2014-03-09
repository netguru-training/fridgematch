class RecipesController < ApplicationController
  expose_decorated(:recipes) { RecipeMatcher.new(current_user).find(10) }
  expose(:diet){ Diet.find(params[:diet_id]) }

  def index
    if params[:diet_id]
      self.recipes.reject do |r|
        diet
      end
    end
  end
end
