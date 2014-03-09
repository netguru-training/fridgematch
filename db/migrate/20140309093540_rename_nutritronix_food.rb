class RenameNutritronixFood < ActiveRecord::Migration
  def change
    rename_table :nutritionix_foods, :nutritional_values
  end
end
