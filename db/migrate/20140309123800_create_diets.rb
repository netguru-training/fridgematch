class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string :name
      t.text :description
      t.integer :protein
      t.integer :fat
      t.integer :carbohydrates
      t.integer :calories

      t.timestamps
    end
  end
end
