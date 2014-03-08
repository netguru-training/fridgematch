class AddFieldsToIngredientCategory < ActiveRecord::Migration
  def change
    add_column :ingredient_categories, :name, :string
  end
end
