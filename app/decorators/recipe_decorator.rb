class RecipeDecorator < Draper::Decorator
  delegate_all

  def missing_ingredients_by_name user
    object.missing_ingredients(user).map(&:name).to_sentence
  end

  def ingredients_to_buy user
    object.missing_ingredients(user).map(&:name).to_a
  end
end