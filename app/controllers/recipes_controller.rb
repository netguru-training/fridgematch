class RecipesController < ApplicationController
  expose_decorated(:recipes) { RecipeMatcher.new(current_user).find(10) }
end
