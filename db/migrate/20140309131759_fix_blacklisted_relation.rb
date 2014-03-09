class FixBlacklistedRelation < ActiveRecord::Migration
  def change
    drop_table :blacklisted_ingredients_users
    create_table :blacklisted_ingredients_users do |t|
      t.integer :user_id
      t.integer :ingredient_id
    end
  end
end
