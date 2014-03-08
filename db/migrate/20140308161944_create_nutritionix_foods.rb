class CreateNutritionixFoods < ActiveRecord::Migration
  def change
    create_table :nutritionix_foods do |t|
      t.string :name
      t.string :unit
      t.string :string
      t.integer :calories
      t.integer :carbohydates
      t.integer :fat
      t.integer :protein

      t.timestamps
    end
  end
end
