class IngredientsController < ApplicationController
  expose(:ingredients) { current_user.ingredients }
  expose(:ingredient, attributes: :ingredient_params)
  expose(:blacklisted_ingredients) { current_user.blacklisted_ingredients }
  expose(:blacklisted_ingredient, attributes: :ingredient_params, model: "Ingredient" ) 
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
    flash[:notice] = "Ingredient deleted!"
    render action: :index
  end

  def show
  end

  def create
    self.ingredient = Ingredient.find_or_create_by(ingredient_params)
    binding.pry
    if ingredient.save
      current_user.ingredients << ingredient
      flash[:notice] = "Ingredient added!"
      redirect_to action: :index
    else
      render :new
    end
  end

  def new_blacklisted
    
  end

  def create_blacklisted
    self.blacklisted_ingredient = Ingredient.find_or_create_by(ingredient_params)
    if blacklisted_ingredient.save
      current_user.blacklisted_ingredients << blacklisted_ingredient
      flash[:notice] = "Blacklisted Ingredient added!"
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
