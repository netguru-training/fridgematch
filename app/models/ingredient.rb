class Ingredient < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_and_belongs_to_many :recipes
  belongs_to :ingredient_category

end