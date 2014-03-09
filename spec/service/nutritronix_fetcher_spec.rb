require 'spec_helper'

describe NutritronixFetcher do

  before :each do
    @fetcher = NutritronixFetcher.new
    @ingredient = Ingredient.new(name: "chicken breast")
    @ingredient.save
    @fetcher.stub(:get_from_api).and_return({"total_hits"=>19346, "max_score"=>10.958775, "hits"=>[{"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"513fceb475b8dbbc210007db", "_score"=>10.958775, "fields"=>{"item_name"=>"Chicken Breast, With Skin - 1 unit (yield from 1 lb ready-to-cook chicken)", "nf_calories"=>114.26, "nf_total_fat"=>4.51, "nf_total_carbohydrate"=>0, "nf_protein"=>17.28}}, {"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"513fceb475b8dbbc210007da", "_score"=>10.957209, "fields"=>{"item_name"=>"Chicken Breast, With Skin - 0.5 breast, bone removed", "nf_calories"=>193.06, "nf_total_fat"=>7.62, "nf_total_carbohydrate"=>0, "nf_protein"=>29.2}}, {"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"513fceb475b8dbbc210007dc", "_score"=>10.818526, "fields"=>{"item_name"=>"Chicken Breast, With Skin - 1 cup, chopped or diced", "nf_calories"=>275.8, "nf_total_fat"=>10.89, "nf_total_carbohydrate"=>0, "nf_protein"=>41.72}}, {"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"513fc9cd673c4fbc26006e47", "_score"=>3.1841297, "fields"=>{"item_name"=>"Breast", "nf_calories"=>357, "nf_total_fat"=>23.39, "nf_total_carbohydrate"=>5.4, "nf_protein"=>31.4}}, {"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"51c549ef97c3e6efadd6020e", "_score"=>1.8821366, "fields"=>{"item_name"=>"Seasoning Mix, Honey BBQ Chicken Glaze", "nf_calories"=>25, "nf_total_fat"=>0, "nf_total_carbohydrate"=>5, "nf_protein"=>0}}, {"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"51c54a1197c3e6efadd60326", "_score"=>1.8821366, "fields"=>{"item_name"=>"Seasoning Mix, Honey Mustard Chicken Glaze", "nf_calories"=>25, "nf_total_fat"=>0, "nf_total_carbohydrate"=>4, "nf_protein"=>1}}, {"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"51c547b997c3e6efadd5f0d1", "_score"=>1.8768919, "fields"=>{"item_name"=>"Season 'n Fry, Seasoning Mix For Coating Chicken", "nf_calories"=>35, "nf_total_fat"=>0, "nf_total_carbohydrate"=>7, "nf_protein"=>1}}, {"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"513fc99a927da70408006883", "_score"=>1.2785165, "fields"=>{"item_name"=>"Chicken Breast", "nf_calories"=>230, "nf_total_fat"=>12, "nf_total_carbohydrate"=>9, "nf_protein"=>22}}, {"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"513fc9e63fe3ffd4030007ad", "_score"=>1.1694251, "fields"=>{"item_name"=>"CHICKEN BREAST", "nf_calories"=>284, "nf_total_fat"=>14.59, "nf_total_carbohydrate"=>12.11, "nf_protein"=>25.95}}, {"_index"=>"nixproductionv13", "_type"=>"item", "_id"=>"513fc998927da70408004a2e", "_score"=>1.0458964, "fields"=>{"item_name"=>"Breast", "nf_calories"=>250, "nf_total_fat"=>14, "nf_total_carbohydrate"=>12, "nf_protein"=>20}}]})
  end

  describe "#get_from_api" do
    it 'returns a hash containing nutritional values' do
      expect(@fetcher.get_from_api).to be_kind_of Hash
    end
  end

  describe "#fetch" do
  it 'creates new nutritional value object of specified ingredient' do
    expect{ @fetcher.fetch(@ingredient) }.to change{ NutritionalValue.count }.by(1)
    end
  end

end