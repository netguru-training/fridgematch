class FixUsersIngredients < ActiveRecord::Migration
  def change
    drop_table :users_ingredients
    create_table :users_ingredients do |t|
      t.integer :user_id
      t.integer :ingredient_id
    end
  end
end
