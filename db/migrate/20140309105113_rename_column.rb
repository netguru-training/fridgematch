class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :nutritional_values, :carbohydates, :carbohydrates
  end
end
