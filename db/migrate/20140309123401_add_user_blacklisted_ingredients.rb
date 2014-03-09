class AddUserBlacklistedIngredients < ActiveRecord::Migration
  def change
    create_table :blacklisted_ingredients_users do |t|
      t.string :user_id
      t.string :ingredient_id
    end
  end
end