class RecipeDecorator < Draper::Decorator
  include ActionView::Helpers::NumberHelper
  delegate_all

  def missing_ingredients_by_name user
    object.missing_ingredients(user).map(&:name).to_sentence
  end

  def ingredients_to_buy user
    object.missing_ingredients(user).map(&:name).to_a
  end

  def percentage_score user
    number_to_percentage( ( object.score(user) * 100 ).round, precision: 0)  
  end

end