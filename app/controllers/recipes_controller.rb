class RecipesController < ApplicationController
  expose(:recipes) { RecipeMatcher.new(current_user).find(10) }
end
