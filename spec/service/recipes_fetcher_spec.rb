require 'spec_helper'

class DummyRecipe
  def self.search_for(*)
    new
  end

  def page(*)
    self
  end

  def get
    {
      'results' => [
        {
          'ingredients' => 'cheese',
          'title' => 'pizza',
          'href' => 'http://example.dev',
          'thumbnail' => 'http://example.dev/image.png',
        },
      ],
    }
  end
end

describe RecipesFetcher do
  let(:fetcher) { RecipesFetcher.new DummyRecipe }

  describe '#run' do
    it 'uses existing ingredient' do
      ingredient = create(:ingredient, name: 'cheese')
      fetcher.run
      expect(Recipe.first.ingredients.first).to eq(ingredient)
    end

    it 'creates new ingredients' do
      expect{ fetcher.run }.to change{ Ingredient.count }.by(1)
    end

    it 'creates new recipe with valid title' do
      fetcher.run
      expect(Recipe.first.title).to eq('pizza')
    end
  end

end

