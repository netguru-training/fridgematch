require 'spec_helper'

describe NutritronixFetcher do

  before :each do
    @fetcher = NutritronixFetcher.new
    @ingredient = Ingredient.new(name: "chicken breast")
    @ingredient.save
    @fetcher.stub(:get_from_api).and_return(FactoryGirl.attributes_for(:nutritional_value))
  end

  it 'creates new nutritional value object of specified ingredient' do
    expect{ @fetcher.fetch(@ingredient) }.to change{ NutritionalValue.count }.by(1)
  end
  
end