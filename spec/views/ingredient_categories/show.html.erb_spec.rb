require 'spec_helper'

describe "ingredient_categories/show" do
  before(:each) do
    @ingredient_category = assign(:ingredient_category, stub_model(IngredientCategory))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
