require 'spec_helper'

describe "ingredient_categories/edit" do
  before(:each) do
    @ingredient_category = assign(:ingredient_category, stub_model(IngredientCategory))
  end

  it "renders the edit ingredient_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ingredient_category_path(@ingredient_category), "post" do
    end
  end
end
