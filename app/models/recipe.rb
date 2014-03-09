class Recipe < ActiveRecord::Base

  has_and_belongs_to_many :ingredients

  validates :title, presence: true, uniqueness: true

  validates :url, presence: true, uniqueness: true

  validates :thumbnail, presence: true, uniqueness: true

  def missing_ingredients user
    self.ingredients - user.ingredients
  end

  def score user
    1 - ( missing_ingredients(user).count.to_f / self.ingredients.count )
  end

  def nutritional_values
    values = Hash.new(0)

    self.ingredients.each do |ingredient| 
      next if ingredient.nutritional_values.empty?
      %i(calories carbohydrates fat protein).each do |type|
        values[type] += ingredient.nutritional_values.first.send(type)
      end
    end
    values
  end


end
