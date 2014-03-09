require 'spec_helper'

describe RecipeMatcher do
  let(:first_recipe){ build_stubbed(:recipe) }
  let(:second_recipe){ build_stubbed(:recipe) }
  let(:first_ingredient){ build_stubbed(:ingredient, recipes: [first_recipe]) }
  let(:second_ingredient){ build_stubbed(:ingredient, recipes: [first_recipe, second_recipe]) }
  let(:user){ build_stubbed(:user, ingredients: [first_ingredient, second_ingredient]) }

  subject do
    RecipeMatcher.new(user)
  end

  describe '#find' do
    it 'returns matching recipes' do
      expect(subject.find).to eq([first_recipe, second_recipe])
    end

    it 'returns best fitting recipe as first' do
      expect(subject.find.first).to eq(first_recipe)
    end

    it 'returns only best recipe' do
      expect(subject.find(1)).to eq([first_recipe])
    end
  end
end
