require "spec_helper"

describe IngredientCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/ingredient_categories").should route_to("ingredient_categories#index")
    end

    it "routes to #new" do
      get("/ingredient_categories/new").should route_to("ingredient_categories#new")
    end

    it "routes to #show" do
      get("/ingredient_categories/1").should route_to("ingredient_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ingredient_categories/1/edit").should route_to("ingredient_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ingredient_categories").should route_to("ingredient_categories#create")
    end

    it "routes to #update" do
      put("/ingredient_categories/1").should route_to("ingredient_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ingredient_categories/1").should route_to("ingredient_categories#destroy", :id => "1")
    end

  end
end
