require 'spec_helper'

describe "ingredient_categories/index" do
  before(:each) do
    assign(:ingredient_categories, [
      stub_model(IngredientCategory),
      stub_model(IngredientCategory)
    ])
  end

  it "renders a list of ingredient_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
