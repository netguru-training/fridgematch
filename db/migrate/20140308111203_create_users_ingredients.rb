class CreateUsersIngredients < ActiveRecord::Migration
  def change
    create_table :users_ingredients do |t|
      t.string :user_id
      t.string :ingredient_id
    end
  end
end
