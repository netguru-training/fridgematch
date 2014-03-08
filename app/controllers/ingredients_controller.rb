class IngredientsController < ApplicationController
  expose(:ingredients) { current_user.ingredients }
  expose(:ingredient, attributes: :ingredient_params)

  autocomplete :ingredient, :name, full: true

  def index
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
    current_user.ingredients.delete(ingredient)
    render action: :index
  end

  def show
  end

  def create
    self.ingredient = Ingredient.find_or_create_by(ingredient_params)
    if ingredient.save
      current_user.ingredients << ingredient
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
