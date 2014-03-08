require 'spec_helper'

describe "ingredient_categories/new" do
  before(:each) do
    assign(:ingredient_category, stub_model(IngredientCategory).as_new_record)
  end

  it "renders new ingredient_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ingredient_categories_path, "post" do
    end
  end
end
