class RecipeMatcher
  def initialize user
    @user = user
  end

  def find limit = 10
    sorted_matches.take(limit)
  end

  private

  def sorted_matches
    find_matches.sort_by{ |s| -s.last }.map(&:first) # => [<Recipe> ,  <Recipe> , ...]
  end

  def find_matches
    @user.ingredients.each_with_object(Hash.new(0)) do |i, match_hash|
      i.recipes.each do |r|
        match_hash[r] += 1
      end
    end
  end
end
