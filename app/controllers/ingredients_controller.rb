class IngredientsController < ApplicationController
  expose(:ingredients) 
  expose(:ingredient, attributes: :ingredient_params)

  def index
  end

  def new
  end

  def edit
  end

  def update
    if ingredient.save
      render action: :index
    else
      render :new
    end
  end

  def destroy
    ingredient.destroy
    render action: :index
  end

  def show
  end

  def create
    if ingredient.save
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
