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

end
