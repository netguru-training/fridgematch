class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :blacklisted_users, inverse_of: :blacklisted_ingredients, class_name: "User"
  has_and_belongs_to_many :users
  has_and_belongs_to_many :recipes
  belongs_to :ingredient_category
  has_many :nutritional_values
  
  validates :name, presence: true, uniqueness: true
end