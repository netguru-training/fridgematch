class AddFieldsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :title, :string
    add_column :recipes, :url, :string
    add_column :recipes, :thumbnail, :string
  end
end
