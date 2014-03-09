require 'spec_helper'

describe IngredientsController do
  let(:ingredient){ create(:ingredient) }
  before do
    @user = FactoryGirl.build(:user)
    @user.save
    controller.stub(current_user: @user)
  end

  context '#destroy' do
    before do
      controller.stub(:render)
      controller.stub(ingredient: ingredient)
      @user.ingredients << ingredient
    end

    it 'removes ingredient from the users ingredients' do
      controller.destroy
      expect(@user.ingredients).not_to include(ingredient)
    end
  end
end
