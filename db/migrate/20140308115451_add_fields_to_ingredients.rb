class AddFieldsToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :name, :string
    add_column :ingredients, :ingredient_category_id, :integer
  end
end
