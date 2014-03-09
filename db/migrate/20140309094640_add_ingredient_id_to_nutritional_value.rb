class AddIngredientIdToNutritionalValue < ActiveRecord::Migration
  def change
    add_column :nutritional_values, :ingredient_id, :integer
  end
end
