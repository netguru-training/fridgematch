require 'spec_helper'

describe IngredientsController do
  let(:ingredient){ create(:ingredient) }
  let(:user){ create(:user) }

  before do
    controller.stub(current_user: user)
  end

  context '#create' do
    it 'adds existing ingredient by its ID to the user' do
      post :create, ingredient: { name: ingredient.name }
      expect(user.ingredients).to include(ingredient)
    end
  end

  context '#destroy' do
    before do
      controller.stub(:render)
      controller.stub(ingredient: ingredient)
      user.ingredients << ingredient
    end

    it 'removes ingredient from the users ingredients' do
      controller.destroy
      expect(user.ingredients).not_to include(ingredient)
    end
  end
end
