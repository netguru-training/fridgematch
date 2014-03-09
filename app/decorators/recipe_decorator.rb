class RecipeDecorator < Draper::Decorator
  include ActionView::Helpers::NumberHelper
  delegate_all

  def missing_ingredients_by_name user
    object.missing_ingredients(user).map(&:name).to_sentence
  end

  def ingredients_to_buy user
    missing_ing = object.missing_ingredients(user)
    return "none" if missing_ing.empty?
    missing_ing.map(&:name).map do |ingredient|
      h.link_to ingredient,"http://groceries.asda.com/asda-webstore/landing/home.shtml?cmpid=ahc-_-ghs-sna1-_-asdacom-dsk-_-hp#/search/"+ ingredient
    end.to_sentence.html_safe
  end

  def percentage_score user
    ( object.score(user) * 100 ).round
  end

end