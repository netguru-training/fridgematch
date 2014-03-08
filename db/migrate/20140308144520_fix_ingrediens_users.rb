class FixIngrediensUsers < ActiveRecord::Migration
  def change
    drop_table :users_ingredients
    create_table :ingredients_users do |t|
      t.integer :user_id
      t.integer :ingredient_id
    end
  end
end
