class RecipesController < ApplicationController
  expose_decorated(:recipes) { RecipeMatcher.new(current_user).find(10) }

  def index
  @diet = Diet.find(params[:diet_id])
  end

end
